
Player p;
Enemy s;

ArrayList bullets;
ArrayList spiders;

float mode;
float posx, posy;
float velx, vely;
float pradius;
float r, rx, ry, grate, gchance;


void setup() {
  size(1024, 768);
  smooth();
  noStroke();

  posx = width/2;
  posy = height/2;

  bullets = new ArrayList();
  spiders = new ArrayList();

  p = new Player (width/2, height/2, 0, 0, 20.0);

  modestart();
}

void draw() {
  if (mode == 1) {
    modestart();
  } 
  else if (mode == 2) {
    modeplay();
  } 
  else if (mode == 3) {
    modeover();
  }
}

void mousePressed() {
  if (mode == 1) {
    modeplay();
  } 
  else if (mode == 2) {
    p.launch();
  } 
  else if (mode == 3) {
    p.health = 500;
    for (int i = 0; i < spiders.size(); i++) {
      Enemy spider = (Enemy)spiders.get(i);
      spiders.remove(i);
    }
    modeplay();
  }
}

void sgenerate() {

  grate = 25;
  r = random(1000);
  rx = random(1000);
  ry = random(1000);

  grate += 10;


  if (r < grate) {
    if (r < grate/3) {
      Enemy spider = new Enemy(rx, -ry/10);
      spiders.add(spider);
    } 
    else if (r > grate/3 && r < grate*2/3) { 
      Enemy spider = new Enemy(-rx/10, random(700));
      spiders.add(spider);
    } 
    else if (r > grate*2/3) {
      Enemy spider = new Enemy(width + rx/10, random(700));
      spiders.add(spider);
    }
  }
}

class Enemy {
  float x;
  float y;
  float vx;
  float vy;
  float angle;
  float enemysize = random(10, 50);
  float speed = 2;
  boolean attack;

  Enemy (float startx, float starty) {
    x = startx;
    y = starty;
  }

  void display() {
    fill(255, 0, 0);
    rect(x - enemysize/2, y - enemysize/2, enemysize, enemysize);
  }

  void move() {
    panglecalc(p.x, p.y);
    vx = cos(angle);
    vy = sin(angle);
    vx *= speed;
    vy *= speed;
    x += vx;
    y += vy;
  }

  void panglecalc(float tx, float ty) {
    angle = atan2(ty - y, tx - x);
  }

  void attack() {
    for (int i = 0; i < spiders.size(); i++) {
      Enemy spider = (Enemy)spiders.get(i);
      if (dist(x, y, p.x, p.y) < 10) {
        spiders.remove(i);
        p.health -= 50;
      }
    }
  }
}

void modestart() {
  mode = 1;

  background(0, 255, 255);
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(50);
  text("Welcome!", width/2, height/4);
  text("Move Left and Right with A and D", width/2, height/2);
  text("Jump with W or Space", width/2, height/2 + 55);
  text("Click to Shoot", width/2, height/2+110);
  text("Click to Begin", width/2, height/2+200);
}

void modeover() {
  mode = 3;

  score = 0;
  p.health = 0;

  background(255);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  text("Click to Restart", width/2, height/2+50);
}

void modeplay() {
  mode = 2;

  background(0, 0, 0, 10);
  health();
  score();

  p.move();
  p.bound();
  p.display();
  p.gravity();

  sgenerate();


  for (int i = 0; i < bullets.size(); i++) { 
    Projectile bullet = (Projectile)bullets.get(i);
    if (bullet.durability > 0) {
      bullet.kill();
      bullet.move();
      bullet.display();
    }
  }

  for (int i = 0; i < spiders.size(); i++) { 
    Enemy spider = (Enemy)spiders.get(i);
    spider.attack();
    spider.move();
    spider.display();
  }

  if (p.health < 0) {
    modeover();
  }
}

float score = 0;

void health () {
  textAlign(RIGHT);
  fill(255);
  textSize(15);
  text("Health: " + p.health, width - 75, height - 75);
}

void score() {
  textAlign(LEFT);
  fill(255);
  textSize(15);
  text("Score: " + score, 75, height - 75);
}

class Platform {
  float x, y;
  float platwidth, platheight;
  
  Platform(float tempx, float tempy, float twidth, float theight) {
    x = tempx;
    y = tempy;
    platwidth = twidth;
    platwidth = theight;
  }
  
  void display() {
    fill(0, 0, 255);
    rect(x - platwidth/2, y - platheight/2, platwidth, platheight);
  }
  
  void force() {
    
  }
  
}
class Player {
  float x, y;
  float vx, vy;
  float r;
  float gravity = .3;
  float jumpheight = 15;
  float health = 500;


  Player(float posx, float posy, float velx, float vely, float pradius) {
    x = posx;
    y = posy;
    vx = velx;
    vy = vely;
    r = pradius;
  }

  void gravity() {
    vy += gravity;
    y += vy;
    bound();
  }

  void display() {
    fill(0, 255, 255);
    ellipse(x, y, r*2, r*2);
  }

  void move() {
    x += vx;

    if (keyPressed == true) {
      if (key == 'a') {
        vx = -5;
      } 
      if (key == 'd') {
        vx = 5;
      } 
      if (y > height - 2*r && (key == 'w' || key == ' ')) {
        vy -= jumpheight;
      }
    } 
    else if (keyPressed == false) {
      vx = 0;
    }
  }

  void bound() {

    y = constrain(y, 0, height-r);
    vy = constrain(vy, -jumpheight, 1000);

    if (x < 0) {
      x = width;
    }

    if (x > width) {
      x = 0;
    }
  }

  void launch() {
    if (mousePressed == true) {
      Projectile bullet = new Projectile(p.x, p.y, 5, 5);
      bullets.add(bullet);
      bullet.panglecalc(mouseX, mouseY);
    }
  }
}

class Projectile {
  float x, y;
  float vx, vy;
  float r;
  float angle;
  float speed;
  float durability = 10;

  Projectile (float startx, float starty, float tspeed, float tradius) {
    x = startx;
    y = starty;
    speed = tspeed;
    r = tradius;
  }

  void move() {
    vx = cos(angle);
    vy = sin(angle);
    vx *= speed;
    vy *= speed;
    x += vx;
    y += vy;
  }

  void panglecalc(float tx, float ty) {
    angle = atan2(ty - y, tx - x);
  }

  void display() {
    fill(255);
    bound();
    ellipse(x, y, r*2, r*2);
  }

  void kill() {
    for (int i = 0; i < spiders.size(); i++) {
      
      Enemy spider = (Enemy)spiders.get(i);
      if (dist(x, y, spider.x, spider.y) < 50) {
        spiders.remove(i);
        //bullets.remove(i);
        p.health += 5;
        score += 10;
      }
    }
  }

  void bound() {
    for (int i = 0; i < bullets.size(); i++) {
      Projectile bullet = (Projectile)bullets.get(i);
      if (y < 0 || y > height || x < 0 || x > width) {
        bullets.remove(i);
      }
    }
  }
}


