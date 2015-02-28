
/*
 * Hyper Balls
 * type g/G to adjust gravity
 *      s/S to adjust springyness
 *      f/F to adjust air friction
 *
 * Based heavily on code by Keith Peters (www.bit-101.com).  
 * Geo Meadows - Iss A 19 Aug2011
 */
 
 
int numBalls = 40;
float spring = 1.2; //collision springback
float gravity = 0.4; //pull towards centre
float friction = 0.95; //gradually reduces speeds

Ball[] balls = new Ball[numBalls]; //ball array called 'balls' of object type 'Ball'

void setup() 
{
  size(480, 480);
  noStroke();
  smooth();
  colorMode(HSB);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(10, 30), i, balls, random(50,255));
  }
  //define mouse driven ball
  balls[0].diameter=40;  
  balls[0].colour=255;
}

void draw() 
{
  background(250,50,50);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display(); 
  }
  
  if(keyPressed) {
    if  (key == 'S' && (spring < 4.0)) {spring += 0.02;}
    else if (key == 's' && (spring > 0.021)) {spring -= 0.02;}
    else if  (key == 'G' && (gravity < 2.0)) {gravity += 0.01;}
    else if (key == 'g' && (gravity > 0.011)) {gravity -= 0.01;}
    else if  (key == 'F' && (friction < 2.0)) {friction += 0.01;}
    else if (key == 'f' && (friction > 0.021)) {friction -= 0.01;}
    println("spring = " + spring + "  gravity = " + gravity + "  friction = " + friction);
  }
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  float rot;
  int id;
  Ball[] others;
  float colour;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin, float col) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin; //an array of 'Ball' objects
    colour = col;
  } 
  
  void collide() {
    int flag = 0;
    for (int i = id + 1; i < numBalls; i++) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].diameter/2 + diameter/2;
        
        float mx = pmouseX - x;
        float my = pmouseY - y;
        float mdistance = sqrt(mx*mx + my*my);
        if (mdistance < diameter/2) {flag++;}
      
        if ((distance < minDist) ) {    
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
    if (id>0) {
    vx *= friction;
    if (x < width/2) { vx += gravity; }
    if (x > width/2) { vx -= gravity; }
    x += vx;  
    
    vy *= friction;
    if (y < height/2) { vy += gravity; }
    if (y > height/2) { vy -= gravity; }     
    y += vy;
    }
    
    else {
     x = pmouseX; y = pmouseY;
    }
    
    if (x + diameter/2 > width) { x = width - diameter/2; vx *= -1;}
    else if (x - diameter/2 < 0) { x = diameter/2; vx *= -1;}
    if (y + diameter/2 > height) { y = height - diameter/2; vy *= -1;} 
    else if (y - diameter/2 < 0) { y = diameter/2; vy *= -1;}
  }
  
  void display() {
  fill(int(colour),255,255);
  ellipse(x, y, diameter, diameter);
  }
}

