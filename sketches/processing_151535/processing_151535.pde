
PImage Right;
PImage Left;
PImage FallingRight;
PImage FallingLeft;
PImage Blur;
PImage ElectroCharging;
PImage ElectroShooting;
PImage ElectroStanding;
PImage ElectroShot;
PImage City;
Electro electrosetup;
Player playersetup;
Shot shotsetup;
int run_test = 0;
int direction = 0;
int attack = 0;
int savedTime;
int Timer1 = 300;
int Timer2 = 900;
int Timer3 = 1500;
int game = 0;

void setup() {
  Right = loadImage("SpidermanRight.png");
  Left = loadImage("SpidermanLeft.png");
  FallingRight = loadImage("SpidermanFlipRight.png");
  FallingLeft = loadImage("SpidermanFlipLeft.png");
  ElectroStanding = loadImage("ElectroStanding.png");
  ElectroShot = loadImage("ElectroShot.png");
  ElectroCharging = loadImage("ElectroCharging.png");
  ElectroShooting = loadImage("ElectroShooting.png");
  City = loadImage("City.jpg");
  Blur = loadImage("SpidermanBlur.png");
  size(700,400);
  frameRate(24);
  playersetup = new Player(100,100,0,5,0);
  electrosetup = new Electro(600,250,10);
  shotsetup = new Shot(600,250,-40);
  savedTime = millis();
  }

void draw() {
  int passedTime = millis() - savedTime;
 image(City,0,0);
  fill(0);
  rect(0,680,700,20);
  playersetup.move();
  playersetup.draw();
  playersetup.keyReleased();
  electrosetup.draw();
  shotsetup.move();
  if (passedTime > Timer2) {
    shotsetup.draw();
  }
}

// spiderman
class Player {
  float face;
  float x;
  float y;
  float x_speed;
  float y_speed;
Player(float CLASS_x,float CLASS_y,float X_Speed,float Y_Speed,float CLASS_face) {
 face=CLASS_face;
 x=CLASS_x;
 y=CLASS_y;
 x_speed=X_Speed;
 y_speed=Y_Speed;
}
void draw() { 
  if (run_test == 0 && (direction == 0)) {
    image(FallingRight,x-10,y);
  } 
  if (run_test == 0 && (direction == 1)) {
    image(FallingLeft,x-10,y);
  }
  if (run_test == 3) {
    image(Blur,x,y);
  }
  if (run_test == 1 && (direction == 0)) {
    image(Right,x,y);
  }
  if (run_test == 2 && (direction == 1)) {
    image(Left,x,y);
  }
}
 
void move() {
  if (y > 250 || y < 0) {
    y_speed = 0;
  }
  if (y > 250 || y < 0 & (direction == 0)) {
    y_speed = 0;
    run_test = 1;
    direction = 0;
  }
  if (y > 250 || y < 0 & (direction == 1)) {
    y_speed = 0;
    run_test = 1;
    direction = 0;
  }
  if (y < 250) {
    y_speed = 10;
    run_test = 0;
  }
    x += x_speed;
    y += y_speed;
    
  if (keyPressed == true); {
    x_speed = 0;
  }
  if (keyPressed && (key=='d')) {
    x_speed = 10;
    face = 0;
    keyPressed = true;
    run_test = 3;
    direction = 0;
    }
  if (keyPressed && (key=='a')) {
    x_speed = -10;
    face = 1;
    keyPressed = true;
    run_test = 3;
    direction = 1;
  }
  if (keyPressed && (key=='w')) {
    y = 210;
  }
}

void keyReleased() {
  if (run_test == 3 && (direction == 0)) {
    run_test = 1;
    direction = 0;
  }
  if (run_test == 3 && (direction == 1)) {
    run_test = 2;
    direction = 1;
  }
}
}
// electro
class Electro {
  float health;
  float attack;
  float x;
  float y;
  Electro(float electro_x, float electro_y, float e_health) {
    health = e_health;
    x = electro_x;
    y = electro_y;
  }
  void draw() {
    int passedTime = millis() - savedTime;
    if (passedTime > Timer1) {
      attack = 1;
    }
    if (passedTime > Timer2) {
      attack = 2;
    }
    if (passedTime > Timer3) {
      attack = 0;
      savedTime = millis();
    }
    if ((health > 0) && (attack == 0)) {
      image(ElectroStanding,x,y);
    }
     if ((health > 0) && (attack == 1)) {
      image(ElectroCharging,x,y-10);
 }
  if ((health > 0) && (attack == 2)) {
      image(ElectroShooting,x-10,y+5);
  }
}
}
class Shot {
  float x;
  float y;
  float x_speed;
  Shot(float shot_x, float shot_y, float shot_speed) {
    x = shot_x;
    y = shot_y;
    x_speed = shot_speed;
  }
 void draw() {
   if (x < 0) {
     x = 600;
   } 
   image(ElectroShot,x,y);
 }
 void move() {
   x+= x_speed;
   }
 }


