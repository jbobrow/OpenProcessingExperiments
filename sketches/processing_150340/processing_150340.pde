
PImage Right;
PImage Left;
Player playersetup;

void setup() {
  Right = loadImage("SpidermanRight.png");
  Left = loadImage("SpidermanLeft.png");
  size(700,700);
  frameRate(24);
  playersetup = new Player(100,100,0,5,0);
}

void draw() {
  background(0,100,190);
  fill(0);
  rect(0,650,0,600,700,600,700,650);
  playersetup.move();
  playersetup.draw();
}

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
 image(Right,x,y);
 if (keyPressed && (key=='d')) {
   image(Right,x,y);
 }
 if (keyPressed && (key=='a')) {
   image(Left,x,y);
 }
}
void move() {
  if (y > 630 || y < 0) {
    y_speed = 0;
  }
  if (y < 630) {
    y_speed = 10;
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
    }
  if (keyPressed && (key=='a')) {
    x_speed = -10;
    face = 1;
    keyPressed = true;
  }
  if (keyPressed && (key=='w')) {
    y -= 10;
  }
}
}


