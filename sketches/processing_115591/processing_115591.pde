
//Array
Ball[] balls;

//Image
PImage pointer;

 

void setup() {
  size(800, 600);
  smooth();
  frameRate(400);
  
  pointer = loadImage("pointer.png");
  balls = new Ball[6000];
  
 
  //Location of the sprinkles
  for (int i = 0; i < balls.length; i++) {
    //DEFINE Ball(float newX, float newY, float newVelocityX, float newVelocityY)
    balls[i] = new Ball(int(random(width)), int(random(height)), 0, 0);
  }
}

 
void draw() {
  background(255);
  
  //Hide Cursor
  if(mousePressed == true) {
    noCursor();
  }
  
  //Sprinkle color seperation and direction
  for (int i = 0; i >= 0 && i<1000; i++) {
    balls[i].display();
    balls[i].pinkSprinkle();
    balls[i].lrdirection();
  }
  for (int i = 1000; i >= 1000 && i<2000; i++) {
    balls[i].display();
    balls[i].blueSprinkle();
    balls[i].lrdirection();
  }
  for (int i = 2000; i >= 2000 && i<3000; i++) {
    balls[i].display();
    balls[i].greenSprinkle();
    balls[i].lrdirection();
  }
  for (int i = 3000; i >= 3000 && i<4000; i++) {
    balls[i].display();
    balls[i].orangeSprinkle();
    balls[i].rldirection();
  }
  for (int i = 4000; i >= 4000 && i<5000; i++) {
    balls[i].display();
    balls[i].periwinkleSprinkle();
    balls[i].rldirection();
  }
  for (int i = 5000; i >= 5000 && i<6000; i++) {
    balls[i].display();
    balls[i].brownSprinkle();
    balls[i].rldirection();
  }
  
  //Wall bounds
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
  }
 
  //Pointer
  pointer.resize(100,140);
  image(pointer, mouseX-30, mouseY-20);
 
}
class Ball {

  float x;
  float y;
  float r = 1.0;
 
  float velocityX = 0.0;
  float velocityY = 0.0;
  float wallLeft = 0.0;
  float wallRight = 793.0;
  float wallTop = 0.0;
  float wallBottom = 593.0;
  float friction = 0.00001;

 
  //Definition of sprinkle
  Ball(float newX, float newY, float newVelocityX, float newVelocityY) {
    x = newX;
    y = newY;
 
    velocityX = newVelocityX;
    velocityY = newVelocityY;
  }
  

//Color functions
void pinkSprinkle() {
  stroke(255,62,150);
  }

void blueSprinkle() {
  stroke(30,144,255);
  }
  
void greenSprinkle() {
  stroke(0,205,0);
  }
  
void orangeSprinkle() {
  stroke(255,215,0);
  }

void periwinkleSprinkle() {
  stroke(224,102,255);
  }
  
void brownSprinkle() {
  stroke(255,97,3);
  }
  
//sprinkle direction

//left to right
void lrdirection() {
  line(x,y, x+7, y+7);
  }
  
//right to left
void rldirection() {
  line(x, y+7, x+7, y);
  }
    
//Sprinkle roundness and weight
void display() {
  strokeCap(ROUND);
  strokeWeight(3.5);
  }
 
//Wall bound functions
void move() {
  //x velocity
  x = x + velocityX;
  
  if (x > width) {
    x = 0;
    }
    
  if ((x + r) > wallRight) {
    x = wallRight - r;
    }
  else if ((x - r) < wallLeft) {
    x = wallLeft + r;
    }
 
  //y velocity
  y = y + velocityY;
    
  if ((y + r) > wallBottom) {
    y = wallBottom - r;
    }
  else if ((y - r) < wallTop) {
    y = wallTop + r;
    }
 
  //Pointer properties
  if(mousePressed) {
   
  float vx = x - mouseX;
  float vy = y - mouseY;
 
  float v_length = sqrt( (vx * vx) + (vy * vy) );
  float vx_norm = vx / v_length;
  float vy_norm = vy / v_length;

  //Pointer force field
  float range = 25.0;
  float strength = map( v_length, 0.0, range, 1.0, 0.0 );
  strength = constrain( strength, 0.0, 1.0 );
  float fx = vx_norm * strength * 10.0;
  float fy = vy_norm * strength * 10.0;
 
  velocityX = velocityX * friction +fx;
  velocityY = velocityY * friction +fy;
  }
    
  else if(!mousePressed) {
    velocityX = 0;
    velocityY = 0;
    }
  }
}



