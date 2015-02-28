
//Blasted in Space
//By Alex Polefko 2014
//Art by Robbie Reed
//Code from Joseph Murphy and RANDY GAUL (2D physics)
//Idea for code from Jeff, a classmate
//Song by RoccoW

import ddf.minim.*;
Minim minim;
AudioPlayer player;
Stars background; 
Asteroids asteroidManager;
Ship ship;
Menu menu;

void setup() {
  hint(DISABLE_DEPTH_TEST);
  size(1280, 720);
  rectMode(CENTER);
  imageMode(CENTER);
  background = new Stars(400);
  asteroidManager = new Asteroids(5);
  ship = new Ship();
  minim = new Minim(this);
  player = minim.loadFile("RoccoW_-_Sea_Battles_in_Space.mp3");
  player.play();
  player.loop();
  menu = new Menu();
}

void draw() {
  
  background(3, 5, 4);
  background.display();
  asteroidManager.display();
  ship.display();
  //println(keyCode);
  println(frameCount); 
  advance();
  menu.drawMenu();
}

void keyPressed() {
  ship.keyPressedDetect();
  menu.keyPressedDetect();
  if (keyCode == 82) {
    reset();
  }
}

void keyReleased() {
  ship.keyReleasedDetect();
  menu.keyReleasedDetect();
}

void reset() {
  background = new Stars(400);
  asteroidManager = new Asteroids(5);
  ship = new Ship();
}

void advance() {
  if (frameCount == 800) {
    asteroidManager = new Asteroids(10);
  }
  if (frameCount == 1600 || frameCount == 2700) {
    asteroidManager = new Asteroids(25);
  }
  if (frameCount > 4000) {
    background = new Stars(400);
    textAlign(CENTER);
    textSize(40);
    text("You suck at this game. Quit now.", width/2, height/2);
    /*asteroidManager.asteroids_.x = 3000;
     asteroidManager.asteroids_.y = 3000;
     ship.x = 7000;
     ship.y = 7000;*/
  }
}

class Asteroid {//name

  //attr
  float x, y, w;
  float xSpeed, ySpeed;
  color c;
  boolean collided;
  PImage img2; 
  
  //const
  Asteroid () {
    // randomizer block
    img2 = loadImage("ALEX_Asteroid4.png"); 
    x = random(0, width);
    y = random(0, height);
    if (x == width/2 || y == height/2 ) { //respawn asteroids if at ship spawn
      x = random(0, width);
      y = random(0, height);
    }
    w = random(45, 55);
    c = color(random(70, 150));
    collided = false;
    int rand1 = round(random(1));
    if (rand1 == 0) {
      xSpeed = random(-1.5, -0.5);
    } 
    else {
      xSpeed = random(0.5, 1.5);
    }
    int rand2 = round(random(1));
    if (rand2 == 0) {
      ySpeed = random(-1.5, -0.5);
    } 
    else {
      ySpeed = random(0.5, 1.5);
    }
  }

  //functions
  void display() {
    noStroke();
    fill(c);
    if (collided) {
      //play sprite explosion flipbook
      x = 10000;
      y = 10000;
    }
    if (x < -w/2) {
      x = width+w/2;
    } 
    else if (x > width+w/2) {
      x = -w/2;
    }
    if (y < -w/2) {
      y = height+w/2;
    }
    else if (y > height+w/2) {
      y = -w/2;
    }
    x += xSpeed;
    y += ySpeed;
    image(img2, x, y); 
    //ellipse(x, y, w, w);
  }
}

//attribution Joseph Murphy

class Asteroids {//name

  //attr
  Asteroid[] asteroids;
  int count;

  //const
  Asteroids(int count_) {
    count = count_;
    asteroids = new Asteroid[count];
    for (int i=0; i<asteroids.length; i++) {
      asteroids[i] = new Asteroid();
    }
  }

  //functions
  void display() {
    detectCollisions();
    for (int i=0; i<asteroids.length;i++) {
      asteroids[i].display();
    }
  }

  void detectCollisions() {
    for (int i = 0; i < this.asteroids.length; i++) {
      for (int j = 0; j < ship.bullets.size(); j++) {
        Projectile bullet_ = ship.bullets.get(j);
        int bulletDist = (int) dist(this.asteroids[i].x, this.asteroids[i].y, bullet_.x, bullet_.y);
        if (bulletDist < (this.asteroids[i].w/2 + bullet_.w/2)) {
          this.asteroids[i].collided = true;
        }
      }
    }
    //if (ship.x == asteroids[i].x && ship.y == asteroids[i].y) {
    //asteroids.remove(i);
    //}
  }
}

class Engine {
  float x,y,xVector,yVector;
  float speed = 8;
  float w = 1.5;
  
  Engine(float xStart_, float yStart_, float xVector_, float yVector_) {
    this.x = xStart_;
    this.y = yStart_;
    this.xVector = xVector_;
    this.yVector = yVector_;
  }
  
  void display() {
    move();
    noStroke();
    fill(232,229,133);
    ellipse(x,y,w,w);
  }
  
  void move() {
    x += speed * xVector;
    y += speed * yVector;
  }
}
boolean enter =true;
PImage shipMenu; 

class Menu {
 
  void drawMenu() {
    
    if (enter) {
      shipMenu = loadImage("shipmenu2.png");
      size(1280, 720);
      background (0);
      image(shipMenu, width/2, height/2); 
    }
  }

  void keyPressedDetect() {
    if (keyCode == 10) {
      enter = false;
    }
  }

  void keyReleasedDetect() {
    if (keyCode == 10) {
      enter = false;
    }
  }
}

class Projectile {
  float x,y,xVector,yVector;
  float speed = 6.5;
  float w = 3;
  
  Projectile(float xStart_, float yStart_, float xVector_, float yVector_) {
    this.x = xStart_;
    this.y = yStart_;
    this.xVector = xVector_;
    this.yVector = yVector_;
  }
  
  void display() {
    move();
    noStroke();
    fill(255,0,0);
    ellipse(x,y,w,w);
  }
  
  void move() {
    x += speed * xVector;
    y += speed * yVector;
  }
}
//import ddf.minim.*;
//Minim minim2;
//AudioSample bang;

class Ship { //name

  //attr
  float x, y, w, r, xSpeed, ySpeed;
  float xSpeed2, ySpeed2;
  float xVector;
  float yVector;
  float xVector2;
  float yVector2;
  float frictionCoefficient = 0.95;
  float acceleration = 0.5;
  float acceleration2 = -0.5;
  float rSpeed = radians(5); // rotation speed 1 degree
  PImage sprite;
  boolean up, down, left, right, spacebar;
  boolean colliding;
  ArrayList<Projectile> bullets;
  ArrayList<Engine> engines;
  int lastFired = 0;
  int shootingDelay = 10;
  int engineDelay = 3;
  PImage img;
  PImage img3; 


  //constr
  Ship() {
    x = width/2;
    y = height/2;
    w = 25;
    r = 0;
    xSpeed = ySpeed = 0;
    bullets = new ArrayList<Projectile>();
    engines = new ArrayList<Engine>();
    img = loadImage("ALEX_Ship06.png"); 
    img3 = loadImage("ALEX_HURT3.png"); 
    //minim2 = new Minim(this);
    //bang = minim2.loadSample("SFX.mp3", 512);
  }

  //methods
  void display() {
    detectAsteroid();
    rotation();
    updateVector();
    thrust();
    move();
    pushMatrix();
    translate(x, y);
    rotate(r);
    displayShip();
    //displayField();
    popMatrix();
    shoot();
    displayBullets();
    blastOff();
    displayEngine();
  }

  void displayShip() {
    // here's where you'll draw the sprite
    //imageMode(CENTER);
    image(img, 0, 0); 
    noStroke();
    fill(255, 255, 0);
    if (spacebar) { 
      image(img3,0,0);
    }
    if (colliding) {
      reset();
    }
    /*beginShape();
    vertex(-10, -5);
    vertex(10, 0);
    vertex(-10, 5);
    endShape();*/
    //
  }

  void displayField() {
    stroke(0, 255, 0);
    noFill();
    ellipse(0, 0, w, w);
  }

  void rotation() {
    if (right) {
      r += rSpeed;
    } 
    if (left) {
      r -= rSpeed;
    }
  }

  void updateVector() {
    xVector = cos(r);
    yVector = sin(r);
    xVector2 = -cos(r);
    yVector2 = -sin(r);
  }

  void thrust() {
    if (up) {
      xSpeed += acceleration * xVector;
      ySpeed += acceleration * yVector;
      xSpeed2 += acceleration2 * xVector2;
      ySpeed2 += acceleration2 * yVector2;
    }
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
    xSpeed *= frictionCoefficient;
    ySpeed *= frictionCoefficient;
    if (x < -w/2) {
      x = width+w/2;
    } 
    else if (x > width+w/2) {
      x = -w/2;
    }
    if (y < -w/2) {
      y = height+w/2;
    }
    else if (y > height+w/2) {
      y = -w/2;
    }
  }

  void keyPressedDetect() {
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == DOWN) {
      down = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
    if (keyCode == 32) {
      spacebar = true;
      //bullet noise
      //bang.trigger();
    }
  }

  void keyReleasedDetect() {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == DOWN) {
      down = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
    if (keyCode == 32) {
      spacebar = false;
    }
  }

  void shoot() {
    int timeSinceLast = frameCount - lastFired;
    if (spacebar && (timeSinceLast > shootingDelay)) {
      bullets.add(new Projectile(x, y, xVector, yVector));
      lastFired = frameCount;
    }
  }

  void blastOff() {
    int timeSinceLast = frameCount - lastFired;
    if (up && (timeSinceLast > engineDelay)) {
      engines.add(new Engine(x, y, xVector2, yVector2));
      lastFired = frameCount;
    }
  }

  void displayBullets() {
    for (int i = 0; i < bullets.size(); i++) {
      Projectile bullet_ = bullets.get(i);
      bullet_.display();
      // check if it's off screen
      if (bullet_.x < -bullet_.w/2 || bullet_.x > width + bullet_.w/2 || bullet_.y < -bullet_.w/2 || bullet_.y > height + bullet_.w/2) {
        bullets.remove(i);
      }
    }
  }

  void displayEngine() {
    for (int i = 0; i < engines.size(); i++) {
      Engine engine_ = engines.get(i);
      engine_.display();
      // check if it's off screen
      if (engine_.x < -engine_.w/2 || engine_.x > width + engine_.w/2 || engine_.y < -engine_.w/2 || engine_.y > height + engine_.w/2) {
        engines.remove(i);
      }
    }
  }

  void detectAsteroid() {
    colliding = false;
    for (int i = 0; i < asteroidManager.asteroids.length; i++) {
      int dist = (int) dist(x, y, asteroidManager.asteroids[i].x, asteroidManager.asteroids[i].y);
      //stroke(255,0,0);
      //line(x,y,asteroidGroup.asteroids[i].x,asteroidGroup.asteroids[i].y);
      if (dist < (this.w/2 + asteroidManager.asteroids[i].w/2)) {
        colliding = true;
        triggerExplode();
      }
    }
  }

  void triggerExplode() {
    // explosion sequence
  }
}

//Star code Joseph Murphy

class Star { //name

  //attr
  float x, y, w;
  float a; 
  float aspeed = random(-4,4); 
  float r, g, b;
  float rspeed;
  //constr
  Star () {
    r = random(0, 200);
    g = random(60, 75);
    b = random(50, 200);
    x = random(width);
    y = random(height);
    w = random(3, 4);
    a = random(0, 255);
  }

  //functions
  void display () {
    fill(a);
    noStroke(); 
    ellipse(x, y, w, w);
  }
  void twinkle() {
    a += aspeed;
    //r += rspeed; 
    if (a > 255 || a < 0) {
      aspeed *= -1;
      //rspeed *= -1;
    }
  }
}

//attribution Joseph Murphy

class Stars {//name

  //attr
  Star[] stars;
  int count;

  //constr
  Stars (int count_) {
    count = count_; 
    stars = new Star[count];
    for (int i=0; i<stars.length; i++) {
      stars[i] = new Star();
    }
  }

  void display () {
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].twinkle();
    }
  }
  /*void twinkle () {
    for (int i=0; i<stars.length; i++) {
      stars[i].twinkle();
    }
  }*/
}



