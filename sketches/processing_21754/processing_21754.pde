
// SpaceShooting Sample / Written by n_ryota / http://cafe.eyln.com
// If 10 fighters shot down all you did win.
// Mouse Move ... Rotate
// Mouse Left Click... Shot
// Mouse Right Click ... Accel
// SPACE KEY ... Accel

//------------------------------------------
int PLAYER = 0, ENEMY = 1, EFFECT = 2;
Player player = new Player(0, 0, 100, 10);
ArrayList fighterList = new ArrayList();
ArrayList bulletList = new ArrayList();
ArrayList effectList = new ArrayList();
float cameraShake = 0.0;
int clearMillis = 0;

//------------------------------------------
class Chara {
  PMatrix3D matrix = new PMatrix3D();
  PVector pos = new PVector(), vel = new PVector();
  float radius, life;
  int group;
  Chara(float _x, float _y, float _z, float _radius, int _group) {
    pos.x = _x; pos.y = _y; pos.z = _z;
    radius = _radius; life = 100.0; group = _group;
  }
  void roll(float rotX, float rotY, float rotZ) {
    matrix.rotateY(radians(rotY));  matrix.rotateX(radians(rotX));  matrix.rotateZ(radians(rotZ));
  }
  void accel(float speed) {
    vel.x += matrix.m02 * -speed;  vel.y += matrix.m12 * -speed;  vel.z += matrix.m22 * -speed;
  }
  void lookAt(PVector vz) {
    PVector vx = vz.cross(new PVector(0,1,0)); vx.normalize();
    PVector vy = vz.cross(vx); vy.normalize();
    matrix.set(vx.x, vy.x, vz.x, pos.x, vx.y, vy.y, vz.y, pos.y, vx.z, vy.z, vz.z, pos.z, 0, 0, 0, 1);
  }
  void updateMatrix() {
    matrix.m03 = pos.x; matrix.m13 = pos.y; matrix.m23 = pos.z;
  }
  void update() {
    pos.x += vel.x; pos.y += vel.y; pos.z += vel.z;
  }
  boolean isHit(Chara chara) {
    if(group==chara.group) return false;
    else return pos.dist(chara.pos) <= radius + chara.radius;
  }
  boolean damage(float _damage) {
    life -= _damage;
    return life<=0.0;
  }
  void draw() {
    pushMatrix(); updateMatrix(); applyMatrix(matrix);
    drawShape();
    popMatrix();
    update();
  }
  void drawShape() {
    fill(255); box(radius);
  }
};

//------------------------------------------
class Fighter extends Chara  {
  Fighter(float _x, float _y, float _z, float _radius, int _group) { super(_x, _y, _z, _radius, _group); }
  Bullet shoot(int power, float radian) {
    Bullet bullet = new Bullet(pos.x, pos.y, pos.z, 7, group, power);
    bullet.matrix.set(matrix);
    if(radian>0) bullet.roll(random_pm(radian), random_pm(radian), random_pm(radian));
    bullet.accel(70);
    bulletList.add(bullet);
    return bullet;
  }
}

//------------------------------------------
class Player extends Fighter {
  Player(float _x, float _y, float _z, float _radius) { super(_x, _y, _z, _radius, PLAYER); }
  void drawShape() {
    stroke(0, 255, 0, 64); strokeWeight(2); noFill();
    translate(0, 0, -10);
    box(radius, radius, radius*5);
    noStroke();
  }
}

//------------------------------------------
class Enemy extends Fighter {
  int level;
  Enemy(float _x, float _y, float _z, float _radius) {
    super(_x, _y, _z, _radius, ENEMY); 
    level = int(random(3));
  }
  void update() {
    PVector vz = new PVector(pos.x-player.pos.x, pos.y-player.pos.y, pos.z-player.pos.z);
    vz.normalize();
    float leapLevel = 0.05 * (1 + level);
    vz.x = lerp(matrix.m02, vz.x, leapLevel);
    vz.y = lerp(matrix.m12, vz.y, leapLevel);
    vz.z = lerp(matrix.m22, vz.z, leapLevel);
    vz.normalize();
    lookAt(vz);
    accel(0.01 * level);
    super.update();
    if( millis()>3000*(1+level) && 0==(millis() % (100-level*20)) ) shoot(10, radians(10 + 10*level));
  }
  void drawShape() {
    fill(200, 200, 200);
    box(radius*1.5, radius*0.1, radius);
    rotateX(radians(45));
    box(radius*0.8, radius*0.7, radius);
  }
}

//------------------------------------------
class Bullet extends Chara  {
  int power;
  Bullet(float _x, float _y, float _z, float _radius, int _group, int _power) {
    super(_x, _y, _z, _radius, _group);
    power = _power;
  }
  void drawShape() {
    damage(0.5);
    if(group==PLAYER) stroke(0, 128, 255, 128);
    else stroke(255, 0, 0, 128);
    strokeWeight(4); fill(255);
    translate(0, radius*7, 0);
    box(radius, radius, radius*20);
  }
}

//------------------------------------------
class Effect extends Chara  {
  Effect(float _x, float _y, float _z, float _radius) { super(_x, _y, _z, _radius, EFFECT); }
  void drawShape() {
    damage(2);
    matrix.scale(1.04);
    matrix.rotateX(0.1);
    fill(255, 64, 32, map(life, 0, 100, 0, 128));
    sphereDetail(7); sphere(radius);
  }
}

//------------------------------------------
void setup() {
  size(640, 480, P3D);
  fighterList.add(player);
  for(int i=0; i<10; i++) {
    fighterList.add(new Enemy(random(-2000, 2000), random(-2000, 2000), random(-5000, -40000), 150));
  }
  textFont( createFont("Lucida Console", 20) );
}

//------------------------------------------
void draw(){
  background(0);

  setLights();
  setPlayerCamera();
  drawStars();

  for (int i=0;i<fighterList.size();i++) {
    Fighter chara = (Fighter) fighterList.get(i);
    chara.draw();
  }

  noLights();
  for (int i=0;i<effectList.size();i++) {
    Effect effect = (Effect) effectList.get(i);
    effect.draw();
    if(effect.life<=0) effectList.remove(i--);
  }

  for (int i=0;i<bulletList.size();i++) {
    Bullet bullet = (Bullet) bulletList.get(i);
    bullet.draw();
    for (int j=0;j<fighterList.size();j++) {
      Fighter fighter = (Fighter) fighterList.get(j);
      if(bullet.isHit(fighter)) {
        if(fighter==player) cameraShake += bullet.power * 0.5;
        if(fighter.damage(bullet.power)) {
          fighterList.remove(j--);
          addExplosionEffect(fighter);
          cameraShake += 1.0;
        }
        bullet.life = 0;
        break;
      }
    }
    if(bullet.life<=0) bulletList.remove(i--);
  }

  camera();
  noLights();
  textMode(SCREEN); textSize(20); textAlign(CENTER, TOP);
  if(player.life>30) fill(0, 255, 0, 128);
  else fill(255, 0, 0, 128);
  if(player.life>0) {
    int enemyNum = fighterList.size()-1;
    if(enemyNum==0) {
      fill(255, 128);
      textSize(40);
      text("MISSION CLEAR", width/2, height/2 - 40);
      if(clearMillis==0) clearMillis = millis();
      text("TIME "+ nf(clearMillis*0.001, 1, 1) + "sec", width/2, height/2 + 30 );
    } else {
      text("" + enemyNum + " enemy" + (enemyNum>1 ? "s " : "" ), width/2, 30);
      textAlign(RIGHT, CENTER);
      text("life " + nf(player.life, 1, 0), width/3, height-30);
      rectMode(CORNER);
      noStroke();
      rect(20+width/3, height-34, map(player.life, 0, 100, 0, width/3), 5);
    }
  } else text("GAME OVER", width/2, height/2);

  input();
  cameraShake *= 0.95;
}

//------------------------------------------
void input(){
  if(mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
    float rotYLevel = map(mouseX, 0, width, -1, 1);
    float rotXLevel = map(mouseY, 0, height, -1, 1);
    player.roll(rotXLevel * abs(rotXLevel) * 3.0, -rotYLevel * abs(rotYLevel) * 3.0, 0.0f);
  }
  if(player.life>0) {
    if((keyPressed && key==' ') || (mousePressed && mouseButton==RIGHT)) player.accel(0.04);
    else player.vel.mult(0.98);
  }
}

//------------------------------------------
void mousePressed() {
  if(player.life>0 && mouseButton==LEFT) player.shoot(30, 1);
}

//------------------------------------------
void addExplosionEffect(Chara chara) {
  for(int i=0; i<3; i++) {
    Effect effect = new Effect(chara.pos.x, chara.pos.y, chara.pos.z, chara.radius);
    effect.vel.set(random_pm(3), random_pm(3), random_pm(3));
    effectList.add(effect);
  }
}

//------------------------------------------
void setPlayerCamera() {
  player.updateMatrix();
  float sl = cameraShake * 0.01;
  PVector sp = new PVector(random_pm(sl), random_pm(sl), random_pm(sl));
  camera(player.pos.x, player.pos.y, player.pos.z,
         player.pos.x-player.matrix.m02+sp.x, player.pos.y-player.matrix.m12+sp.y, player.pos.z-player.matrix.m22+sp.z,
         player.matrix.m01, player.matrix.m11, player.matrix.m21);
}

//------------------------------------------
void setLights() {
  ambientLight(50, 50, 70); 
  directionalLight(255, 255, 255, 0, 1, 0); 
}

//------------------------------------------
float modulo(float a, float b) {
  return a - floor(a / b) * b;
}

//------------------------------------------
float random_pm(float range) {
  return random(-range, range);
}

//------------------------------------------
void drawStars() {
  pushMatrix();
  translate(player.pos.x, player.pos.y, player.pos.z);
  int seed = int(random(1000)); randomSeed(0);
  float range = 500.0;
  PVector starPos = new PVector();
  for(int i=0; i<250; i++) {
    strokeWeight(int(random(1,3))); stroke(random(128,255));
    starPos.set(random_pm(range*100), random_pm(range*100), random_pm(range*100));
    line(starPos.x, starPos.y, starPos.z, starPos.x, starPos.y, starPos.z);

    starPos.set(random(range), random(range), random(range));
    starPos.x = modulo(-player.pos.x + starPos.x, range) - range * 0.5;
    starPos.y = modulo(-player.pos.y + starPos.y, range) - range * 0.5;
    starPos.z = modulo(-player.pos.z + starPos.z, range) - range * 0.5;
    line(starPos.x, starPos.y, starPos.z, starPos.x-player.vel.x*(range*0.001), starPos.y-player.vel.y*(range*0.001), starPos.z-player.vel.z*(range*0.001));
  }
  randomSeed(seed);

  noStroke();
  fill(0, 0, 255);
  translate(-20000,0,-30000);
  sphereDetail(30); sphere(20000);
  popMatrix();
}

