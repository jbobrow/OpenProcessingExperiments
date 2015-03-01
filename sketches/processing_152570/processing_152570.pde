
Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int score = 0;
int where;
PVector location;
Boss boss = null;
PImage img, img2;
boolean bossSpawn = false;
ArrayList<Puddle> puddles = new ArrayList<Puddle>();

void setup() {
  size(600, 600);
  img = loadImage("gX83n6U.png");
  img2 = loadImage("CwPwc6T.png");
  player = new Player(new PVector(width/2, height/2));
  noStroke();
}

void draw() {
  if (player.alive)image(img, 0, 0);
  else {
    image(img2, 0, 0);
  }
  if (!player.alive) colorMode(HSB, 360, 100, 100);
  background(255);

  // randomized enemy spawning off screen
  where = (int)random(4);
  if (where == 1) {
    location = new PVector(-110, random(height));
    where = (int)random(4);
  }
  if (where == 2) {
    location = new PVector(width+110, random(height));
    where = (int)random(4);
  }
  if (where == 3) {
    location = new PVector(-50, random(width));
    where = (int)random(4);
  }
  if (where == 0) {
    location = new PVector(height+50, random(width));
    where = (int)random(4);
  }

  if (boss == null && bossSpawn == false) {
    if (frameCount%300 == 0) {
      Enemy e = new Enemy(location);
      enemies.add(e);
    }
  }
  if (boss == null && bossSpawn == true) {
    textSize(16);
    fill(0);
    text("You find a gun upgrade! Fire rate increased", 0, 15);
    text("Enemies now drop puddles of blood, watch your step!", 0, 36);
    if (frameCount % 120 == 0) {
      Enemy g = new Enemy(location);
      enemies.add(g);
      where = (int)random(4);
    }
  }
  if ( boss != null && bossSpawn ==true) {
    if (frameCount%900 == 0) {
      Enemy f = new Enemy(location);
      enemies.add(f);
    }
  }

  // puddle draw;
  for (int i = 0; i < puddles.size (); i++) {
    Puddle pud = puddles.get(i);
    pud.draw();
  }

  // Enemy update
  int size = enemies.size();

  for (int i = 0; i < enemies.size (); i++) {
    Enemy en = enemies.get(i);
    en.update();
    en.draw();
    if (player.hitCharacter(en) && en.deathTimer == -1 && en.hitTimer == 0 && player.alive) {
      player.health = player.decreaseHealth(player.health);
      en.hitTimer = 120;
    }
    if (size != enemies.size()) {
      i--;
      size = enemies.size();
    }
  }

  // Boss update;
  if (score >= 10 && boss == null && bossSpawn == false) {
    boss = new Boss(location);
    bossSpawn = true;
  }
  if (boss != null) {
    boss.update();
    if(boss!=null) boss.draw(); // check a second time 'cause boss could have died
  }

  // Player Update
  if (up) player.move(upForce);
  if (down) player.move(downForce);
  if (left) player.move(leftForce);
  if (right) player.move(rightForce);

  if (player.firing) player.fire();

  for(int i = 0; i < puddles.size(); i++){
    Puddle pud = puddles.get(i);
    if(pud.check()){
      player.acc.mult(0.8);
    }
  }

  player.update();
  player.draw();

  //HUD
  fill(0);
  textSize(24);
  text("Score: " + score, width-120, 50);
  //reload timer
  textSize(16);
  fill(0);
  text("Reload", 20, 540);
  fill(100, 15, 15);
  rect(20, 540, 60*2 + 20, 40);
  fill(168, 128, 128);
  rect(30, 550, 60*2, 20);
  fill(179, 32, 32);
  rect(30, 550, 60*2 - player.reload*2, 20);

  //health bar
  fill(0);
  text("Health", 530, 540);
  fill(100, 15, 15);
  rect(360, 540, 10*20 + 20, 40);
  fill(168, 128, 128);
  rect(370, 550, 10*20, 20);
  fill(179, 32, 32);
  rect(370, 550, player.health*20, 20);

  //death
  if (!player.alive) {
    fill(150, 50, 50);
    textSize(32);
    text("You are DEAD", 200, 520);
    textSize(16);
    text("and the spirits of the fallen are mad", 160, 535);
  }
}

class Boss extends Character {
  ArrayList<Projectile> projectiles;
  PVector pVel = new PVector(0, -2);
  int reload = 0;
  boolean retreat = false;
  int deathTimer = -1;

  Boss(PVector pos) {
    super(pos);
    health = 10;
    c = color(0, 255, 0);
    projectiles = new ArrayList<Projectile>();
    cWidth = 50;
    cHeight = 45;
  }

  void fire() {
    Projectile p = new Projectile(new PVector(cos(atan2(player.pos.y-pos.y, player.pos.x-pos.x))*5, sin(atan2(player.pos.y-pos.y, player.pos.x-pos.x))*5));
    projectiles.add(p);
    p.shotFired(this);
    reload = 30;
  }

  void update() {
    
    if(reload == 0 && health > 0){
      fire();
    }
    
    for (int i = 0; i < projectiles.size (); i++) {
      Projectile m = projectiles.get(i);
      if (m.hitEnemy(player)) {
        if (!m.removed) {
          projectiles.remove(i);
          i--;
        }
      }
      m.update();
      m.draw();
    }

    if (reload > 0) reload--;
    if(health != 0) move();
    super.update();
    
    if (health == 0 && deathTimer == -1) {
      if(player.alive)score += 1;
      vel.x = 0;
      vel.y = 0;
      deathTimer = 120;
    }
    if (deathTimer > 0) deathTimer--;
    if (deathTimer == 0) boss = null;
  }
  

  void move() {
    int speed = 4;
    if (dist(pos.x, pos.y, player.pos.x, player.pos.y) > 200 && retreat == false) {
      if (player.pos.x >= pos.x) vel.x = speed;
      else if (player.pos.x <= pos.x) vel.x = -speed;

      if (player.pos.y >= pos.y) vel.y = speed;
      else if (player.pos.y <= pos.y) vel.y = -speed;
    }

    if (dist(pos.x, pos.y, player.pos.x, player.pos.y) <= 200) retreat = true;
    if (dist(pos.x, pos.y, player.pos.x, player.pos.y) >= 300) retreat = false;
    if(retreat == true){
      if (player.pos.x >= pos.x) vel.x = -speed;
      else if (player.pos.x <= pos.x) vel.x = speed;

      if (player.pos.y >= pos.y) vel.y = -speed;
      else if (player.pos.y <= pos.y) vel.y = speed;
    }
  }

  void draw() {
    if(health != 0) angle = atan2(player.pos.y-pos.y, player.pos.x-pos.x) + PI/2;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    translate(20, -30);

    //Hands
    fill(235, 203, 176);
    ellipse(0, 15, 15, 20);
    ellipse(-10, 5, 15, 20);

    //Gun
    fill(GRAY);
    rect(-10, 3, 10, 20);
    rect(-8, -20, 6, 40);
    rect(-10, -30, 10, 10);
    // NOTE: Gun does not have a hitbox and projectiles will fire from the tip

    popMatrix();
    super.draw();
  }
}

class Character {
  PVector pos, vel, acc;
  int health;
  float cWidth, cHeight;
  color c;
  float angle;

  Character(PVector pos) {
    this.pos = pos;
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
    angle = 0;
  }

  void update() {
    vel.add(acc);
    vel.mult(0.8);
    pos.add(vel);
    acc.set(0, 0, 0);
  }

  void move(PVector force) {
    acc.add(force);
  }

  int decreaseHealth(int h) {
    h -= 1;
    return h;
  }

  boolean hitCharacter(Character c) {
    if ( abs(pos.x - c.pos.x) < cWidth/2 + c.cWidth/2 &&
      abs(pos.y - c.pos.y) < cHeight/2 + c.cHeight/2) {
      return true;
    }
    return false;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    fill(c);
    ellipse(-20, 0, 25, cHeight/1.6);
    ellipse(20, 0, 25, cHeight/1.6);
    fill(255, 223, 196);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}

class Enemy extends Character {
  float speedX;
  float speedY;
  int deathTimer = -1;
  int hitTimer = 0;
  boolean retreat;

  Enemy(PVector pos) {
    super(pos);
    health = 3;
    c = color(0);
    cWidth = 50;
    cHeight = 45;
  }

  void update() {
    if (health != 0) move();
    super.update();
    if (health == 0 && deathTimer == -1) {
      if (player.alive)score += 1;
      vel.x = 0;
      vel.y = 0;
      deathTimer = 120;
      if (boss == null && bossSpawn == true) {
        Puddle pud = new Puddle(pos);
        puddles.add(pud);
      }
    }
    if (deathTimer > 0) deathTimer--;
    if (deathTimer == 0) enemies.remove(this);
    if (hitTimer > 0) hitTimer--;
  }


  void move() {
    speedX = 2;
    speedY = 2;
    if (dist(player.pos.x, player.pos.y, pos.x, pos.y) < 300) { 
      speedX = 4;
      speedY = 4;
    }
    if (pos.x + 4 > player.pos.x && pos.x - 4 < player.pos.x) speedX = 1;
    if (pos.y + 4 > player.pos.y && pos.y - 4 < player.pos.y) speedY = 1;

    if (dist(pos.x, pos.y, player.pos.x, player.pos.y) <= 10) retreat = true;
    if (dist(pos.x, pos.y, player.pos.x, player.pos.y) >= 50) retreat = false;

    if (retreat == false) {
      if (player.pos.x >= pos.x) vel.x = speedX;
      else if (player.pos.x < pos.x) vel.x = -speedX;

      if (player.pos.y >= pos.y) vel.y = speedY;
      else if (player.pos.y < pos.y) vel.y = -speedY;
    }
    if (retreat == true) {
        if (player.pos.x >= pos.x) vel.x = -speedX;
        else if (player.pos.x < pos.x) vel.x = speedX;

        if (player.pos.y >= pos.y) vel.y = -speedY;
        else if (player.pos.y < pos.y) vel.y = speedY;
      }
  }

  void draw() {
    if (health != 0) angle = atan2(player.pos.y-pos.y, player.pos.x-pos.x) + PI/2;

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    translate(20, -37);

    //Hands
    fill(235, 203, 176);
    ellipse(0, 15, 15, 30);
    ellipse(-40, 15, 15, 30);

    popMatrix();
    super.draw();
    if (deathTimer != -1) {
      pushMatrix();
      translate(pos.x, pos.y);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      popMatrix();
    }
  }
}

boolean up, down, left, right;

float speeds = 2;
PVector upForce = new PVector(0, -speeds);
PVector downForce = new PVector(0, speeds);
PVector leftForce = new PVector(-speeds, 0);
PVector rightForce = new PVector(speeds, 0);

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      up = true;
      down = false;
    }
    if (keyCode == DOWN) {
      down = true;
      up = false;
    }
    if (keyCode == LEFT) {
      left = true;
      right = false;
    }
    if (keyCode == RIGHT) {
      right = true;
      left = false;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) up = false;
    if (keyCode == DOWN) down = false;
    if (keyCode == LEFT) left = false;
    if (keyCode == RIGHT) right = false;
  }
}

void mousePressed(){
  if(player.reload == 0){
    player.firing = true;
  }
}

/*
Enemies are made to be stackable for strategic plays.
Being able to run through them is intentional too.

Dead enemies will soak bullets for their allies.

You won't be safe even after death, ghosts will still haunt you.






*/
class Player extends Character {
  PVector pVel = new PVector(0, -2);
  ArrayList<Projectile> projectiles;
  boolean firing;
  int reload = 0;
  boolean alive = true;

  Player(PVector pos) {
    super(pos);
    health = 10;
    projectiles = new ArrayList<Projectile>();
    c = color(120, 134, 107);
    cWidth = 50;
    cHeight = 45;
  }

  void fire() {
    Projectile p = new Projectile(new PVector(cos(atan2(mouseY-pos.y, mouseX-pos.x))*5, sin(atan2(mouseY-pos.y, mouseX-pos.x))*5));
    projectiles.add(p);
    p.shotFired(this);
    firing = false;
    if (boss == null && bossSpawn == true) reload = 10;
    else {
      reload = 60;
    }
  }

  void update() {

    for (int i = 0; i < projectiles.size (); i++) {
      Projectile m = projectiles.get(i);

      if (boss != null) {
        if (m.hitEnemy(boss)) {
          if (!m.removed) {
            projectiles.remove(i);
            m.removed = true;
            i--;
          }
        }
      }

      for (int j = 0; j < enemies.size (); j++) {
        Enemy e = enemies.get(j);
        if (m.hitEnemy(e)) {
          if (!m.removed) {
            projectiles.remove(i);
            m.removed = true;
            i--;
          }
        }
      }


      m.update();
      if (m.boundsCheck()) {
        if (!m.removed) {
          projectiles.remove(i);
          i--;
        }
      }
      m.draw();
    }
    if (reload > 0) reload--;
    if (health <= 0) alive = false;
    if (health < 0) health = 0;
    super.update();
    boundsCheck();
  }

  void boundsCheck() {
    if (pos.x - cWidth < 0) pos.x = cWidth;
    if (pos.x + cWidth > width) pos.x = width-cWidth;
    if (pos.y - cHeight < 0) pos.y = cHeight;
    if (pos.y + cHeight > height) pos.y = height-cHeight;
  }

  void draw() {
    angle = atan2(mouseY-pos.y, mouseX-pos.x) + PI/2;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    translate(20, -30);

    //Hands
    fill(235, 203, 176);
    ellipse(0, 15, 15, 20);
    ellipse(-10, 5, 15, 20);

    //Gun
    fill(GRAY);
    rect(-10, 3, 10, 20);
    rect(-8, -20, 6, 40);
    rect(-10, -30, 10, 10);
    // NOTE: Gun does not have a hitbox and projectiles will fire from the tip

    popMatrix();
    super.draw();
  }
}

class Projectile {
  PVector pos, vel;
  float fireAng;
  boolean removed = false;
  float tempx;
  float tempy;

  Projectile(PVector vel) {
    this.vel = vel;
  }

  void shotFired(Character c) {
    if (c instanceof Player) {
      tempx = mouseX;
      tempy = mouseY;
    }
    if (c instanceof Boss) {
      tempx = player.pos.x;
      tempy = player.pos.y;
    }
    pos = new PVector(c.pos.x + 15*(cos(atan2(tempy-c.pos.y, tempx-c.pos.x)+PI/2)) - sin(atan2(tempy-c.pos.y, tempx-c.pos.x)+PI/2) * -70, 
    c.pos.y + 15*(sin(atan2(tempy-c.pos.y, tempx-c.pos.x)+PI/2)) + cos(atan2(tempy-c.pos.y, tempx-c.pos.x)+PI/2) * -70);
  }


  boolean hitEnemy(Character e) {
    if (abs(pos.x - e.pos.x) < 5 + e.cWidth/2 &&
      abs(pos.y - e.pos.y) < 5 + e.cHeight/2) {
      if (e.health != 0) e.health = e.decreaseHealth(e.health);
      return true;
    }
    return false;
  }

  void update() {
    pos.add(vel);
  }

  boolean boundsCheck() {
    if (pos.x - 5 > width || pos.x + 5 < 0 || pos.y + 5 > height || pos.y - 5 < 0) {
      return true;
    }
    return false;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}

class Puddle {
  PVector pos;

  Puddle(PVector pos) {
    this.pos = pos;
  }

  boolean check(){
    if ( abs(pos.x - player.pos.x) < 25 + player.cWidth/2 &&
      abs(pos.y - player.pos.y) < 25 + player.cHeight/2) {
      return true;
    }
    return false;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255, 0, 0, 80);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}



