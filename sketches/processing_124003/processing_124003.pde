
Ship ship;
PVector[] stars = new PVector[100];
ArrayList<SpaceObject> spaceObjects = new ArrayList<SpaceObject>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
ArrayList<ParticleFlare> particleFlares = new ArrayList<ParticleFlare>();

int gameState = 0;
PFont font;
int score;
int numLives;


int SPLASH_SCREEN = 0;
int MAIN_GAME = 1;
int LOST_LIFE = 2;
int GAME_OVER = 3;
int NEXT_LEVEL = 4;

int[] numRocksPerLevel = {
  1, 5, 6, 8, 10, 12, 16, 20
};
int[] numUfos = {
  3, 0, 1, 2, 3, 4, 5, 6
};
int level = 0;

void setup() {
  size(800, 600);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new PVector(random(width), random(height));
  }
  for (int i = 0; i < numRocksPerLevel[level]; i++) {
    spaceObjects.add(new Asteroid(random(-50, 50), random(-50, 50), 4));
  } 
  for (int i = 0; i < numUfos[level]; i++) {
    spaceObjects.add(new UFO());
  }
  ship = new Ship();
  smooth();
  font = loadFont("BankGothic-Medium-48.vlw");
  textFont(font);
  score = 0;
  numLives = 3;
}

void draw() {
  if (gameState == SPLASH_SCREEN) {
    drawSplashScreen();
  }
  if (gameState == MAIN_GAME) {
    drawBackground();
    moveAllGameObjects();
    checkCollisions();
    displayAllGameObjects();
    if (ship.fireing)ship.fire();
    checkLevelUp();
  }
  if (gameState == LOST_LIFE) {
    drawBackground();
    moveAllGameObjects();
    displayAllGameObjects();
    text("Press space to continue", width/2-80, height/3);
    ship= new Ship();
    numLives--;
  }
  if (gameState == GAME_OVER) {
    displayGameOver();
  }
  if (gameState == NEXT_LEVEL) {
    drawBackground();
    displayAllGameObjects();
    text("Press space to continue", width/2-80, height/3);
    //ship= new Ship();
  }
}
void moveAllGameObjects() {
  for (int i = 0; i < spaceObjects.size(); i++) {
    SpaceObject spaceObj = (SpaceObject) spaceObjects.get(i);
    spaceObj.move(bulletList);
  }
  for (int i = 0; i < particleFlares.size(); i++) {
    ParticleFlare p = particleFlares.get(i);
    p.move();
    if (p.age > 60) {
      particleFlares.remove(i);
      i--;
    }
  }
  for (int i = 0; i < bulletList.size(); i++) {
    Bullet b = (Bullet) bulletList.get(i);
    b.move(spaceObjects);
  }
  ship.move();
}

void checkCollisions() {
  for (Bullet b: bulletList) {
    for (Asteriod a:spaceObjects) {
      if (dist(a.loc.x, a.loc.y, b.loc.x, b.loc.y) < a.soSize*10) {
        particleFlares.add(new ParticleFlare(a.loc.x, a.loc.y));
        bulletList.remove(b);
        if (a.soSize > 1) {
          score += 100;
          spaceObjects.add(new Asteroid(a.loc.x, a.loc.y, a.soSize-1));
          spaceObjects.add(new Asteroid(a.loc.x, a.loc.y, a.soSize-1));
        }
        spaceObjects.remove(a);
        return;
      }
    }
    for (UFO u:spaceObjects) {
      if (dist(u.loc.x, u.loc.y, b.loc.x, b.loc.y) < 20) {
        particleFlares.add(new ParticleFlare(b.loc.x, b.loc.y));
        bulletList.remove(b);
        score += 1000;
        spaceObjects.remove(u);
      }
    }
  }
}
void displayAllGameObjects() {
  for (int i = 0; i < spaceObjects.size(); i++) {
    SpaceObject spaceObj = (SpaceObject) spaceObjects.get(i);
    spaceObj.display();
  } 
  for (int i = 0; i < bulletList.size(); i++) {
    Bullet b = (Bullet) bulletList.get(i);
    b.display();
  }

  for (int i = 0; i < particleFlares.size(); i++) {
    ParticleFlare p = particleFlares.get(i);
    p.display();
  }

  ship.display();
}

void keyPressed() {
  if (key == 'a' || key == 'A') ship.left = true;
  if (key == 'd' || key == 'D') ship.right = true;
  if (key == 'w' || key == 'W') ship.forward = true;
  if (key == 's' || key == 'S') ship.backward =true;
  if (key == ' ') {
    ship.fireing = true;
  }
}

void keyReleased() {
  // press any key to start!
  if (gameState == SPLASH_SCREEN ) {
    gameState = MAIN_GAME;
  }

  if (gameState == LOST_LIFE) {
    if (key == ' ') {
      gameState = MAIN_GAME;
    }
  }
  if (gameState == NEXT_LEVEL) {
    if (key == ' ') {
      gameState = MAIN_GAME;
    }
  }
  if (gameState == GAME_OVER || gameState == NEXT_LEVEL) {
    if (key == ' ') {
      gameState = MAIN_GAME;
      setup();
    }
  }
  if (gameState == MAIN_GAME) {
    if (key == 'a' || key == 'A') ship.left = false;
    if (key == 'd' || key == 'D') ship.right = false;
    if (key == 'w' || key == 'W') ship.forward = false;
    if (key == 's' || key == 'S') ship.backward =false;
    if (key == ' ') ship.fireing = false;
  }
  ship.invincible = false;
}
void drawSplashScreen() {
  drawBackground();

  textSize(30);
  text("ASTEROIDS", width/2-50, height/2-60);
  textSize(20);
  text("Press space to start!", width/2-60, height/2);
}

void displayGameOver() {
  drawBackground();
  textSize(20);
  text("GAME OVER!", width/2-60, height/2-100);
  text("Press space to start!", width/2-80, height/2);
}

void drawBackground() {
  background(0);
  stroke(255);
  for (int i = 0; i < stars.length; i++) {
    point(stars[i].x, stars[i].y);
    stars[i].x -= .2;
    if (stars[i].x <0) stars[i].x += width;
  }
  drawScoreAndLives();
}
void drawScoreAndLives() {
  int x = 10;
  int y = 20;
  for (int i = 0; i < numLives; i++) {
    pushMatrix();
    translate(x, y);
    rotate(-PI/2);
    noFill();
    stroke(0, 255, 0);
    beginShape();
    vertex(16, 0);
    vertex(-8, -8);
    vertex(0, 0);
    vertex(-8, 8);
    endShape(CLOSE);
    popMatrix();
    x += 30;
  }
  text("Score: "+score, width/2, 30);
}

void checkLevelUp() {
  for (SpaceObject s: spaceObjects) {
    if (s instanceof Asteroid || s instanceof UFO ) {
      return;
    }
  }
  gameState = NEXT_LEVEL;
  if (level < 8)level++;
  setup();
}

class Asteroid extends SpaceObject {

  float speed;
  float ang;
  float orbit;
  float orbitRotator;
  int soSize;

  Asteroid() {
    loc = new PVector(random(width), random(height));
    speed = random(1, 3);
    ang = random(-PI, PI);
    orbitRotator = random(.2);
    soSize = 4;
    vel = new PVector(cos(ang)*speed, sin(ang)*speed);
  }

  Asteroid(float nx, float ny, int nsoSize) {
    loc = new PVector( nx, ny);
    soSize = nsoSize;
    speed = random(1, 3);
    ang = random(-PI, PI);
    orbitRotator = random(.2);
    vel = new PVector(cos(ang)*speed, sin(ang)*speed);
  }

  void move(ArrayList<Bullet> list) {
    super.move(list);

    if (loc.x < 0) loc.x += width;
    if (loc.x > width) loc.x -= width;
    if (loc.y < 0) loc.y += height;
    if (loc.y > height) loc.y -= height;




    orbit+=orbitRotator;
    if (dist(loc.x, loc.y, ship.x, ship.y) < soSize*10 && ship.invincible == false) {
      list.add(new ParticleFlare(ship.x, ship.y, color(0, 255, 0)));
      list.add(new ParticleFlare(ship.x+random(-10, 10), ship.y+random(-10, 10), color(0, 255, 0)));
      list.add(new ParticleFlare(ship.x, ship.y, color(200, 10, 0)));
      gameState = LOST_LIFE;
    }
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(orbit);
    //soSize(soSize);
    noFill();
    stroke(255);
    beginShape();
    vertex(4*soSize, -10*soSize);
    vertex(8*soSize, -8*soSize);
    vertex(10*soSize, 1*soSize);
    vertex(4*soSize, 8*soSize);
    vertex(-2*soSize, 2*soSize);
    vertex(-7*soSize, 5*soSize);
    vertex(-7*soSize, -4*soSize);
    vertex(-4*soSize, -8*soSize);
    endShape(CLOSE);
    popMatrix();
  }
}

class Bullet extends SpaceObject {
  float ang;
  float speed;
  float mx, my;

  Bullet(float nx, float ny, float ang) {
    loc.x = nx;
    loc.y = ny;
    speed = 7;
    vel.x = cos(ang)*speed;
    vel.y = sin(ang)*speed;
  }

  void move(ArrayList<SpaceObject> list) {
    super.move(list);
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) {
      list.remove(this);
      return;
    }
    // Check each rock to see if it is hit.
//    for (int i = 0; i < list.size(); i++) {
//      Object o = list.get(i) ;
//      if (o instanceof Asteroid) {
//        Asteroid r = (Asteroid) o;
//        
//        if (dist(loc.x, loc.y, r.loc.x, r.loc.y)< r.scale*10) {
//          list.add(new ParticleFlare(r.loc.x, r.loc.y));
//          if (r.scale > 1) {
//            score += 100;
//            list.add(new Asteroid(r.loc.x, r.loc.y, r.scale-1));
//            list.add(new Asteroid(r.loc.x, r.loc.y, r.scale-1));
//          }
//          list.remove(this);
//          list.remove(r);
//          break;
//        }
//      }
//      else if (o instanceof UFO) {        
//        UFO r = (UFO) list.get(i);
//        if (dist(loc.x, loc.y, r.loc.x, r.loc.y)< r.scale) {
//          list.add(new ParticleFlare(r.loc.x, r.loc.y));
//          list.remove(this);
//          list.remove(r);
//        }
//      }
//    }
  }

  void display() {
    stroke(255);
    fill(255);
    ellipse(loc.x, loc.y, 2, 2);
  }
}

class ParticleFlare extends SpaceObject {
  int age;
  PVector[] particleLocs;
  PVector[] particleVels;
  color c;


  ParticleFlare(float x, float y) {
    super();
    age = 0;
    int randNum = (int) random(10, 20);
    particleLocs = new PVector[randNum];
    particleVels = new PVector[randNum];

    for (int i = 0; i < randNum; i++) {
      particleLocs[i] = new PVector(x, y);
      particleVels[i] = new PVector(random(-5,5), random(-5,5));
    }
    c = color(255);
  }

  ParticleFlare(float x, float y, color nc) {
    //Call the constructor above
    this(x, y);
    c = nc;
  }

  void move(ArrayList list) {
    age++;
    for (int i = 0; i < particleLocs.length; i++) {
      particleLocs[i].add(particleVels[i]);
      particleVels[i].mult(.98);
    }
  }
  void display() {
    stroke(c);
    for (int i = 0; i < particleLocs.length; i++) {
      float x = particleLocs[i].x;
      float y = particleLocs[i].y;
      point(x, y);
    }
  }
}

class Ship {

  float x, y;
  float speed;
  float acceleration;
  float ang;
  boolean right, left, forward, backward, fireing;
  String powerUp;
  int fireCounter;
  boolean invincible;

  Ship() {
    x = width/2;
    y = height/2;
    speed = 0.0;
    ang = random(-PI, PI);
    acceleration=0;
    powerUp = "";
    fireCounter = 0;
    invincible = true;
  }

  void move() {
    if (right) ang += .1;
    if (left) ang -= .1;
    if (forward) {
      if (speed< 7)acceleration += .05;
    }
    else {
      acceleration *= .5;
    }
    if (backward) acceleration -= .1;    
    // Add the acceleration to the speed, but limit how fast it can go.
    speed += acceleration;
    // Slow the ship down once you take your foot off the gas.  
    speed = speed*.95;
    // Moves the ship in the angle it is facing.
    x += cos(ang)*speed;
    y += sin(ang)*speed;

    // If the ship moves off the screen, send it to the other side.
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
    fireCounter--;
  }

  void display() {
    if (ship.invincible)
      stroke(255, 255, 40);
    else
      stroke(0, 255, 0); 

    pushMatrix();
    translate(x, y);
    rotate(ang);
    noFill();
    beginShape();
    vertex(16, 0);
    vertex(-8, -8);
    vertex(0, 0);
    vertex(-8, 8);
    endShape(CLOSE);
    popMatrix();
  }

  void fire() {
    if (fireCounter <= 0) {
      //      if (powerUp.equals("spread")) {
      //        // POWERUP???
      //        spaceObjects.add(new Bullet(x, y, ang));
      //        spaceObjects.add(new Bullet(x, y, ang-PI/6));
      //        spaceObjects.add(new Bullet(x, y, ang+PI/6));
      //      } 
      //      else {
      Bullet b = new Bullet(x, y, ang);
      b.move(spaceObjects);
      bulletList.add(b);
      fireCounter = 10;

      //      }
    }
  }
}

class SpaceObject {

  PVector loc;
  PVector vel;
  
  SpaceObject(){
    loc = new PVector();
    vel = new PVector();
  }

  void move(ArrayList<Bullet> list) {
    loc.add(vel);
   
    
  }


  void display() {
  }
  
  void splode(){
  }
}

class UFO extends SpaceObject {
  int soSize;
  UFO() {
    scale = 10;
    loc = new PVector(random(width), random(height));
    vel = new PVector(3, 0);
  }

  void move(ArrayList list) {
    super.move( list);
    if (loc.x < 0) loc.x += width;
    if (loc.x > width) loc.x -= width;
    if (loc.y < 0) loc.y += height;
    if (loc.y > height) loc.y -= height;

    if (dist(loc.x, loc.y, ship.x, ship.y) < soSize*10 && ship.invincible == false) {
      list.add(new ParticleFlare(ship.x, ship.y, color(0, 255, 0)));
      list.add(new ParticleFlare(ship.x+random(-10, 10), ship.y+random(-10, 10), color(0, 255, 0)));
      list.add(new ParticleFlare(ship.x, ship.y, color(200, 10, 0)));
      gameState = LOST_LIFE;
    }
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    noFill();
    stroke(255);
    beginShape();
    vertex(-6, - 16);
    vertex(6, - 16);
    vertex(8, - 8);
    vertex(20, 0);
    vertex(8, 8);
    vertex(-8, 8);
    vertex(-20, 0);
    vertex(-8, -8);
    vertex(-6, - 16);
    endShape(CLOSE);
    line(20, 0, -20, 0);
    line(-8, -8, 8, -8);
    popMatrix();
  }
}



