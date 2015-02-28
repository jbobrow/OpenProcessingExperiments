
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;


int numJewels = 40;

//vertices
PVector vertices [] [];
boolean isPyramid = false;


float xmag, ymag = 0;
float newXmag, newYmag = 0; 

float spring = 0.05;
float gravity = 0.0003;
float friction = -0.9;
Ball[] balls = new Ball[numJewels];

void setup() 
{
  size(1000, 720, P3D);
  colorMode(RGB, 2);
  
  img = loadImage("1176162513415_AfricanAmethyst_JohnDyer.png");
  img2 = loadImage("A-modified-rectangular-cut-Fancy-Vivid-Purple-Pink-diamond-of-6.89-carats-2.png");
  img3 = loadImage("em2.png");
  img4 = loadImage("garnet-1951.png");
  img5 = loadImage("Blue-Diamond.png");
  img6 = loadImage("pearl.png");
  img7 = loadImage("Princess_Diamond_White_BG.png");
  img8 = loadImage("pink-pearl.png");
  img9 = loadImage("Heart_Diamond_White_BG.png");
  img10 = loadImage("Diamond%20Broker%20in%20Dallas copy.png");
  

  noStroke();
  for (int i = 0; i < numJewels; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
}

void draw() 
{
  //image(img, 0, 0, width, height);
  background(0);
  for (int i = 0; i < numJewels; i++) {
    balls[i].collide();
    balls[i].move();
    //balls[i].display();  
  }
  for (int i = 0; i < numJewels/10; i++) {
    balls[i].display1();  
  }
  for (int i = numJewels/10; i < numJewels/10*2; i++) {
    balls[i].display2();  
  }
  for (int i = numJewels/10*2; i < numJewels/10*3; i++) {
    balls[i].display3();  
  }
  for (int i = numJewels/10*3; i < numJewels/10*4; i++) {
    balls[i].display4();  
  }
  for (int i = numJewels/10*4; i < numJewels/10*5; i++) {
    balls[i].display5();  
  }
  for (int i = numJewels/10*5; i < numJewels/10*6; i++) {
    balls[i].display6(); 
  }
  for (int i = numJewels/10*6; i < numJewels/10*7; i++) {
    balls[i].display7(); 
  }
  for (int i = numJewels/10*7; i < numJewels/10*8; i++) {
    balls[i].display8(); 
  }
  for (int i = numJewels/10*8; i < numJewels/10*9; i++) {
    balls[i].display9(); 
  }
  for (int i = numJewels/10*9; i < numJewels; i++) {
    balls[i].display10();     
    

    
    pushMatrix(); 
 
  translate(width/2, height/2, -30); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  scale(50);
  beginShape(TRIANGLES);
  
  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);

  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);
  fill(0, 0, 0); vertex(-1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(0, 1, 1); vertex(-1,  1,  1);

  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);
  
  
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 1, 0); vertex(-1, -1, -1);
  fill(1, 0, 1); vertex( 1,  1, -1);
  fill(0, 1, 1); vertex(-1,  1, -1);
  
  
  fill(0, 0, 0); vertex( 1, -1, -1);
  fill(0, 1, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1, -1);
  fill(0, 1, 0); vertex( 1, -1,  1);

  endShape();
  
  popMatrix(); 
  }
  
  
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    
    
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numJewels; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img, x, y, diameter, diameter);
  }
  
  void display1() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img, x, y, diameter, diameter);
  }
  void display2() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img2, x, y, diameter, diameter);
  }
  void display3() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img3, x, y, diameter, diameter);
  }

  void display4() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img4, x, y, diameter, diameter);
  }
  
    void display5() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img5, x, y, diameter, diameter);
  }
  
      void display6() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img6, x, y, diameter, diameter);
  }
  
      void display7() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img7, x, y, diameter, diameter);
  }
  
      void display8() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img8, x, y, diameter, diameter);
  }
  
      void display9() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img9, x, y, diameter, diameter);
  }
  
      void display10() {
    fill(255, 204);
    //ellipse(x, y, diameter, diameter);
    image(img10, x, y, diameter, diameter);
  }
}

void mousePressed()
{
  setup();
}



