
int numBalls = 100;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
PImage img;
float x1=0;
float y1=0;
float speed=20;

void setup() {
  size(1000, 600);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  noStroke();
  fill(255, 204);
  
  img= loadImage("jelly1.jpg");
}

void draw() {
  background(255);
  textSize(40);
  fill(0, 102, 153);
  text("Catch Those Cute Jellyfishes!",100,100);
  if (numBalls<1){textSize(50);
  fill(0, 102, 153);
  text("Why you hate Jellyfish so much?",100,300);}
  if (numBalls<21){textSize(30);
  fill(0, 102, 153);
  text("OMG! less than 20 of them here!",100,200);}
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
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
    for (int i = id + 1; i < numBalls; i++) {
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
    fill(225,225,0);
ellipse(x1,y1,100,100);  }
   
  
  
  void display() {
    image(img,x, y, diameter, diameter);
    if(dist(x,y,x1,y1)<10){
 numBalls-=1;}
 
  }
  
  
}
 void keyPressed(){
    
    if (keyCode ==RIGHT) {
      x1+=speed;
      x1+=speed*2;

      fill(225,225,0);
ellipse(x1,y1,5,5);} 
     if (keyCode ==LEFT){
       x1+=speed;
      x1-=speed*2;
      fill(225,225,0);
ellipse(x1,y1,5,5);} 
    if(keyCode==DOWN){
      y1+=speed;
      y1+=speed*2;
      fill(225,225,0);
ellipse(x1,y1,5,5);} 
      if(keyCode==UP){
        y1+=speed;
        y1+=-speed*2;
        fill(225,225,0);
      ellipse(x1,y1,5,5);}
      
 }




