
float Timer=0;

float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;


int numBalls = 72;
float spring = 0.50;
float gravity = 0.030;
float friction = -0.5;
Ball[] balls = new Ball[numBalls];
int ballCount = 1500;
int ballSize = 35;
int ballSpeed = 50;
float[]xspeed = new float[ballCount];
float[]yspeed = new float[ballCount];
float[]xpos = new float[ballCount];
float[]ypos = new float[ballCount];
float[]wdth = new float[ballCount];
float[]ht = new float[ballCount];
int[]colors = new int[ballCount];
 
 
void setup()
{
  size(700, 500);
    //colorMode(HSB, 360, 100, 100, 100);
     
    // Run at 60fps.
    frameRate(60);
     
    background(0);
     
    center = width / 2.0;
    prevX = center;
    prevY = center;

  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
for (int p = 0; p < ballCount; p++) {
    xspeed[p] = random(1, ballSpeed);
    yspeed[p] = random(-ballSpeed, ballSpeed);
    wdth[p] = random(1, ballSize);
    ht[p] = wdth[p];
    xpos[p] = width/2+random(-width/25, width/5);
    ypos[p] = height+random(-height/25, height/25);
    colors[p] = color(random(150), random(300), random(275));
    fill(colors[p]);
  } 
 
}
}
 
void draw()
{
  Timer+=.067;
  
  if(Timer <5){
  
  background(255,62,99);
  {
   
  }
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display(); 
  }
  for (int p = 0; p < ballCount; p++) {
    fill(colors[p]);
    rect(xpos[p], ypos[p], wdth[p], ht[p]);
    ellipse(xpos[p], ypos[p], wdth[p], ht[p]);
    xpos[p]+=sin(p)*xspeed[p];
    ypos[p]+=cos(p)*yspeed[p];
   
    if (xpos[p]+wdth[p]/2>=width || xpos[p]<=wdth[p]/2) {
      xspeed[p]*=-1;
    }
    if (ypos[p]+ht[p]/2>=height || ypos[p]<=ht[p]/2) {
      yspeed[p]*=-1;
    }
  }}
 if (Timer > 5 && Timer <15)
 {fill(255.0,255.0,255.0,(Timer-5)*50);
 rect(0,0,700,500);
 
 } 
 if(Timer >15)
 {float spiralOffset = 10.0;
    float x = radius * cos((Timer-15) * spiralOffset);
    float y = radius * sin((Timer-15) * spiralOffset);
    x += center;
    y += center;
     if (Timer <180){
    strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(random(255), random(255), random(255));
    line(prevX, prevY, x, y);}
     
     if(Timer >180){ 
    stroke(random(255), random(255), random(255));
pushMatrix();
 translate(400,400);
 rotate(radians(frameCount));
 
  beginShape();
  vertex( 400, 400 );
  vertex(399, 404);
  vertex( 395, 395 );
  vertex( 28, 26 );
  vertex( 405, 405 );
  vertex( -64, -20 );
  vertex(400, 410);
  endShape(CLOSE);
popMatrix();}
 

     
    prevX = x;
    prevY = y;
         
    radius += 0.2;
 
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
  }
   
  void display() {
    fill(255, 400);
    ellipse(x, y, diameter, diameter);
  }
}





