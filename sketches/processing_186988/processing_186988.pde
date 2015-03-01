
// RPG Sample (c)2014 NISHIDA Ryota - http://dev.eyln.com (zlib License)

final int ChipSize = 32;
int cx(int x) { return x * ChipSize; }
int cy(int y) { return y * ChipSize; }
int icx(int x) { return x / ChipSize; }
int icy(int y) { return y / ChipSize; }

interface Drawable { void draw(); }
ArrayList<Drawable> drawableObjs = new ArrayList<Drawable>();

Battle battle;
Map map;
Chara player;
  
int mousePressedCount = 0;
boolean mouseClicked = false;
boolean isJavaScript = (4/3)!=1;

//---------------------------------------------- Main
void setup() {
  size(800, 600);
  frameRate(30);
  textSize(ChipSize);
  textAlign(LEFT, CENTER);
  drawableObjs.add(map = new Map());
  drawableObjs.add(player = new PlayerChara());
  drawableObjs.add(battle = new Battle());
}

void draw() {
  if(mousePressed) {
    mouseClicked = (mousePressedCount <= 0);
    mousePressedCount++;
  } else {
    mouseClicked = false;
    mousePressedCount = 0;
  }
  for(Drawable obj : drawableObjs) {
    obj.draw();
  }
  drawStatus();
}

void drawStatus() {
  pushMatrix();
    player.shakeTranslate();
    translate(0, height - ChipSize * 1.5f); 
    fill(0); rect(0, 0, width, ChipSize * 1.5f);

    if(player.hp <= 0) {
      fill(255, 0, 0, 128); rect(0, 0, width, ChipSize * 1.5f);
      fill(255, 0, 0);
    } else if(player.hp < player.maxHp / 3) fill(255, 255, 0);
    else fill(255);
    text("HP " + player.hp, ChipSize, ChipSize * 0.6f);
    text("Lv." + player.lv + "  EXP " + player.exp, ChipSize * 15, ChipSize * 0.6f);
    player.drawHp(ChipSize * 4.5f, ChipSize * 0.45f, ChipSize * 9, ChipSize / 2);
  popMatrix();
}

//---------------------------------------------- Map
class Map implements Drawable {
  int x = 0, y = 0;
  int w = width / ChipSize;
  int h = height / ChipSize;

  final int CHIP_GLASS = 0;
  final int CHIP_FOREST = 1;
  final int CHIP_MOUNTAIN = 2;
  final int CHIP_MOUNTAIN_WALL = 3;
  final int CHIP_SEA = 4;
  final int CHIP_DEEP_SEA = 5;
  
  final color[] ChipTypeColors = {
    color(80, 200, 80),   // CHIP_GLASS
    color(40, 120, 40),   // CHIP_FOREST
    color(200, 80, 30),   // CHIP_MOUNTAIN
    color(200, 200, 200), // CHIP_MOUNTAIN_WALL
    color(90, 180, 210),  // CHIP_SEA
    color(0, 0, 128),     // CHIP_DEEP_SEA
  };

  void draw() {
    noiseSeed(1);
    noStroke();
    for(int iy=0; iy<=h; iy++) {
      for(int ix=0; ix<=w; ix++) {
        int type = chipType(x + ix, y + iy);
        fill(ChipTypeColors[type]);
        //fill(noise((x + ix) / (float)w, (y + iy) / (float)h) * 255);
        rect(cx(ix), cy(iy), ChipSize, ChipSize);
      }
    }
  }
  
  int chipType(int x, int y) {
      float n = noise(x / (float)w, y / (float)h);
      if(isJavaScript) { n = n * 2.4f - 0.6f; }
      int type = CHIP_GLASS;
      if(n < 0.3f) type = CHIP_DEEP_SEA;
      else if(n < 0.33f) type = CHIP_SEA;
      else if(n > 0.8f) type = CHIP_MOUNTAIN_WALL;
      else if(n > 0.7f) type = CHIP_MOUNTAIN;
      else if(n > 0.6f) type = CHIP_FOREST;
      return type;
  }
  
  boolean isWall(int x, int y) {
    int type = chipType(x, y);
    return type >= CHIP_MOUNTAIN_WALL;
  }
}

//---------------------------------------------- Characters
class Chara implements Drawable {
  int x, y;
  color headColor, bodyColor;
  int hp = 10, maxHp = 10;
  int power = 3, lv = 1, exp = 1;
  float shake = 0.0f;

  Chara(int x, int y, color headColor, color bodyColor) {
    this.x = x;
    this.y = y;
    this.headColor = headColor;
    this.bodyColor = bodyColor;
  }
  
  void update() {}
  void draw() {
    pushMatrix();
      translate(cx(x - map.x), cy(y - map.y));
      drawShape();
    popMatrix();
    update();
  }
  
  void shakeTranslate() {
    float shakeLevel = ChipSize / 8;
    translate(sin(shake * TWO_PI * 4) * shakeLevel, sin(shake * TWO_PI * 8) * shakeLevel);
  }

  void drawShape() {
    pushMatrix();
      shake = max(shake - 1.0f / frameRate, 0.0f);
      shakeTranslate();
      noStroke();
      fill(headColor);
      rect(0, 0, ChipSize, ChipSize / 2);
      fill(bodyColor);
      rect(0, ChipSize / 2, ChipSize, ChipSize / 2);
    popMatrix();
  }

  void drawHp(float x, float y, float w, float h) {
    fill(255, 0, 0); rect(x, y, w, h); 
    fill(255, 255, 0); rect(x, y, hp / (float)maxHp * w, h); 
  }

  void damage(int power) {
    hp = max(hp - power, 0);
    shake = 0.15f;
  }
  void heal(int power) { hp = min(hp + power, maxHp); }

  void addExp(int exp) {
    this.exp += exp;
    if(this.exp > 10 * (lv + lv / 2)) {
      lv++;
      maxHp += 1 + int(random(3 + lv));
      hp = maxHp;
    }
  }
}

class PlayerChara extends Chara {
  PlayerChara() {
    super(icx(width / 2), icy(height / 2), color(0, 160, 255), color(0, 90, 255));
  }
  
  void update() {
    if(battle.isFight() || mousePressedCount <= 1) return;

    mousePressedCount = 0;
    int mcx = int(map.x + mouseX / ChipSize);
    int mcy = int(map.y + mouseY / ChipSize);
    int nx = int(x), ny = int(y);
    if(nx < mcx) nx++; else if(nx > mcx) nx--;
    if(map.isWall(nx, ny)) nx = x;
    if(ny < mcy) ny++; else if(ny > mcy) ny--;
    if(map.isWall(nx, ny)) ny = y;
    if((nx != x || ny != y) && !map.isWall(nx, ny)) {
      x = nx; y = ny;
      int margin = 4;
      if(map.x > x - margin) map.x = x - margin;
      else if(map.x + map.w < x + margin) map.x = x + margin - map.w;
      if(map.y > y - margin) map.y = y - margin;
      else if(map.y + map.h < y + margin) map.y = y + margin - map.h;
      player.heal(1);
      
      if(random(100) < 2 + 2 * map.chipType(x, y)) {
        battle.encount(1 + int(abs(x) + abs(y) + random(20)) / 50);
        mousePressedCount = 1;
      }
    }
  }

  void damage(int power) {
    super.damage(power);
    if(hp <= 0 && lv > 1) { //---- Dead
      maxHp = int(max(hp / 2, 10)); power /= 2; lv /= 2;
      exp = 10 * (lv + lv / 2);
    }
  }
}

class EnemyChara extends Chara {
  EnemyChara(int lv) {
    super(0, 0, color(min(lv * 10 + 60, 255), random(255), random(255)), color(random(255), random(90), random(90)) );
    this.lv = lv;
    this.maxHp = this.hp = int(2 + random(1, lv) + lv);
    this.power = int(max(lv / 4 + random(0, lv / 4), 1));
    this.exp = int(lv + power / 2);
  }
}

//---------------------------------------------- Battle System
class Battle implements Drawable {
  int margin = ChipSize * 2;
  int x = margin * 2;
  int y = margin;
  int w = width - margin * 4;
  int h = height - margin * 3;
  float t = 0.0f;
  ArrayList<EnemyChara> enemys = new ArrayList<EnemyChara>();
  float enemyTruenWait = 0.0f;
  Button attackButton = new Button("Attack", x, h - (margin - 4) * 1, w, margin);
  Button escapeButton = new Button("Escape", x, h - (margin - 4) * 0, w, margin);

  boolean isFight() { return enemys.size() > 0; }
  
  void encount(int lv) {
    enemys.clear();
    int iMax = (int)random(1, min(lv, 5));
    for(int i=0; i<iMax; i++) {
      enemys.add(new EnemyChara(lv));
    }
    t = 0.0f; enemyTruenWait = 0.0f;
  }
  
  void update() {
    boolean isEnemyTurn = enemyTruenWait > 0.0f;
    enemyTruenWait = max(enemyTruenWait - 1.0f / frameRate, 0.0f);
    if(enemyTruenWait > 0.0f) return;

    if(isEnemyTurn) {
      int enemyCount = 0;
      int exp = 0;
      for(EnemyChara e : enemys) {
        if(e.hp > 0) {
          player.damage(e.power);
          if(player.hp <= 0) { exp = 0; break; }
          enemyCount++;
        } else { exp += e.exp; }
      }
      if(enemyCount <= 0 || player.hp <= 0) { //---- Finish
        player.addExp(exp);
        enemys.clear();
      }
    } else if(mouseClicked) {
      if(attackButton.isClicked()) { //---- Atack
        EnemyChara target = null;
        for(EnemyChara e : enemys) {
          if(e.hp > 0) { target = e; break; }
        }
        if(target != null) {
          target.damage(player.power);
          enemyTruenWait = 0.3f;
        }
      }
  
      if(escapeButton.isClicked()) {
        if(random(100) < 50) {
          enemyTruenWait = 0.3f; //--- Miss
        } else {
          enemys.clear(); //---- Escape
        }
      }
    }
  }

  void draw() {
    if(!isFight()) return;

    pushMatrix();
    t = min(t + 0.1f, 2.0f);
    if(t < 1.0f) {
      fill(160, sin(t * 2 * TWO_PI) * 255);
      rect(0, 0, width, height);
    } else {
      translate(width/2, height/2);
      float s = 2 - t;
      scale(1 - s * s * s * s);
      translate(x-width/2, y-height/2);
      fill(0, 200);
      stroke(255); strokeWeight(4);
      rect(2, 2, w - 4, h - 4);
      noStroke();

      //---- Draw Enemys
      translate(margin, margin);
      scale(3);
      int cw = ChipSize + ChipSize / 4;
      translate(cw * (4 - enemys.size()) / 2 - ChipSize / 4, 0);
      for(EnemyChara e : enemys) {
        if(e.hp > 0) {
          e.drawShape();
          e.drawHp(e.x, e.y + ChipSize + ChipSize / 4, ChipSize, ChipSize / 8);
        }
        translate(cw, 0);
      }
    }
    popMatrix();

    if(t>=2.0f) {
      attackButton.draw();
      escapeButton.draw();
    }
    update();
  }
}

//---------------------------------------------- Button
class Button implements Drawable {
  String label;
  int x, y, w, h;
  int frame = 4;
  color bgColor = color(0);
  color labelColor = color(255);
  color activeBgColor = color(255);
  color activeLabelColor = color(0);
   
  Button(String label, int x, int y, int w, int h) {
    this.label = (label == null) ? "" : label;
    this.x = x; this.y = y; this.w = w; this.h = h;
  }

  boolean isHit() { return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h - frame; }
  boolean isClicked() { return mousePressed && isHit(); }
  
  void draw() {
    fill(isHit() ? activeBgColor : bgColor);
    stroke(activeBgColor);
    strokeWeight(frame);
    rect(x + frame / 2, y + frame / 2, w - frame, h - frame);
    noStroke();
    fill(isHit() ? activeLabelColor : labelColor);
    text(label, x + 16, y + h / 2);
  }
}
