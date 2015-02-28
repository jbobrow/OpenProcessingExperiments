
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim b;
Minim e;
AudioPlayer soundwave;
AudioPlayer soundmaker;

int amount = 0;
int circleWidth= 100;
int a = 1;
float v = 5;

int amountP = 100;
int amountPcount = 100;
float velocity, velocity2;
float x, y, x2, y2;
float ballWidth, ballHeight;
float velocityX, velocityX2;
boolean fire;
int col;

Particle[] particles;

class Ball {
  float w=16;
  float h=16;
  float xPos;
  float yPos;
  float rSpeed;
  float xGrav;
  float yGrav;
  float rGravity;
  float r;
  float theta;
  float colourCounter=0;
  int trans = 255;
  
  Ball(float x, float y) {
    theta = atan(y/x);
    r = dist(x+250, y+250, width/2.0, height/2.0);
    if(x < 0){
      r = -r;
    }
  }
}

ArrayList<Ball> ballContainer = new ArrayList<Ball>();
  float gravityXmult = 0.1;
  float gravityYmult = 0.1;
  float maxSpeed = 10;
  
color from = color(255, 0, 0);
color to = color(255, 255, 0);


void setup() {
  size(500,500);
  smooth();
  background(0);
  e = new Minim(this);
  soundwave = e.loadFile("Explode.wav");
  b = new Minim(this);
  soundmaker = b.loadFile("beep3.wav");
  particles = new Particle[amountP*100];
  for(int k = 0; k < amountP; k++)
  {
 
    particles[k] = new Particle(random(-10, 10), random(-2, 0), width/2, height/2, color(0), int(random(20, 50)));
 
  }
}


void drawball(Ball myball) {
  color col = lerpColor(to, from, myball.colourCounter);
  fill(col, myball.trans);
  noStroke();
  myball.xPos = (myball.r * cos(myball.theta))+250;
  myball.yPos = (myball.r * sin(myball.theta))+250;
  ellipse(myball.xPos, myball.yPos, myball.w, myball.h);
  myball.xGrav = ((width/2)-myball.xPos)/(width/2.0)*gravityXmult;
  myball.yGrav = ((height/2)-myball.yPos)/(height/2.0)*gravityYmult;
  myball.rGravity = -sqrt(myball.xGrav*myball.xGrav+myball.yGrav*myball.yGrav);
  
  if(myball.colourCounter >2){
    myball.xGrav = 0;
  myball.yGrav = 0;
  myball.rGravity = 0;
  myball.rSpeed = 0;
  }
  
  if(myball.xPos<width/2.0){
    myball.rGravity = -myball.rGravity;
  }
  myball.rSpeed += myball.rGravity;
  if(myball.rSpeed > 8){
    myball.rSpeed = 8.0;
  }
  myball.r += myball.rSpeed;

  
 
  
  for(int i = 0; i<ballContainer.size() ; i++){
    for(int j = 0; j<ballContainer.size(); j++){
      if(i != j){
      Ball balli = ballContainer.get(i);
      Ball ballj = ballContainer.get(j);
        if(dist(balli.xPos, balli.yPos, ballj.xPos, ballj.yPos)<8){
        balli.colourCounter = balli.colourCounter + 0.00005;
        ballj.colourCounter = ballj.colourCounter + 0.00005;
          if(balli.colourCounter >=1 && balli.colourCounter <=2){
            balli.colourCounter = 1;
          }
          if(ballj.colourCounter >=1 && ballj.colourCounter <=2){
            ballj.colourCounter = 1;
          }
        }
      
      }
    }
  }

for(int i = 0; i<ballContainer.size() ; i++){
  Ball balli = ballContainer.get(i);
    if(balli.colourCounter == 1){
      if(dist(mouseX, mouseY, balli.xPos, balli.yPos)<8){
        balli.r = height*3;
        balli.colourCounter = 3;
        soundwave.rewind();
        soundwave.play();
     
        fire = true;
          for(int k = 0; k < amountPcount; k++){
            col = lerpColor(to, from, random(0,1));
            particles[k] = new Particle(random(-30, 30), random(-30, 30), mouseX, mouseY, color(col), int(random(20, 100)));
          }
          amountPcount=amountPcount+100;
            if(amountPcount>=10000){
              amountPcount = 100;
            }
          }
        }
      }

    }
  
  

void draw() {
  
  background(0);
  for(Ball ball : ballContainer) {
    drawball(ball);
  }
  
  if(fire){
    for(int k = 0; k < amountP; k++){
      particles[k].drawParticle();
 
    }
  }
  
}

void mouseDragged(){
    for(int i = 0; i<ballContainer.size() ; i++){
      Ball balli = ballContainer.get(i);
        if(dist(mouseX, mouseY, balli.xPos, balli.yPos)<4){
          soundmaker.rewind();
          soundmaker.play();
        }
    }
}

void mousePressed(){
  if (mouseButton == LEFT){
  ballContainer.add(new Ball(mouseX-250.0, mouseY-250.0));
  }
  
}



class Particle{
  float  velY, velX;
  float x, y, px, py;
  float ballWidth, ballHeight;
  color col;
  int life;
 
  Particle(float velX_, float velY_, float x_, float y_, color col_, int life_){
    velY = velY_;
    velX = velX_;
    ballHeight = 10;
    ballWidth = 10;
    x = x_;
    y = y_;
    px = x_;
    py = y_;
    col = col_;
    life = life_;
  }
 
  void drawParticle(){
    y = y + velY;
    x = x + velX;
    if(life > 0){
      stroke(col, life);
 
      line(px, py, x, y );
      px = x;
      py = y;
      life--;
    }
  }
 
 
 
}
 


