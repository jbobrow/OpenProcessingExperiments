
int tamanho=40;
int numBalls = 12;
float spring = 0.05;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
//float velNegra = 3;
//float posX= 100;
//float posY = 100;
float vx = 10;
int BolaNegra;
float [] x = new float [numBalls];
float [] y = new float [numBalls];
float posX;
float posY;


void setup() 
{
  size(600, 300);
  background(71,170,7);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(20,2), i, balls);
    balls[i].vx = random(0,1);
    balls[i].vy = random(0,1);
  }
  fill(0);
  stroke(0);
  posX = mouseX;
  posY = mouseY;
  
}

void draw() 
{
  background(71,170,7);
  fill(0);
  stroke(0);
  ellipse(0,0,tamanho,tamanho);
  ellipse(600,0,tamanho,tamanho);
  ellipse(300,0,tamanho,tamanho);
  ellipse(300,300,tamanho,tamanho);
  ellipse(0,300,tamanho,tamanho);
  ellipse(600,300,tamanho,tamanho);
  
  fill(0);
  stroke(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display(); 
  }

  BolaNegra();
  
  if (mousePressed){
    posX += 5;
   posY += 4; 
   /*if((posX <= 10)||(posX >=width-10)){
      posX -= 2;}
      if((posY <=10)||(posY >=height-10)) {
        posX -= 2;}*/
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
    ellipse(x, y, diameter, diameter);
  }
  
}

void BolaNegra(){
  stroke(0);
  fill(0);
    ellipse(posX,posY,20,20); 
    
   }


