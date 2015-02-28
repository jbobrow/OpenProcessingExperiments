
float opreyY = 400;
float opreyX = 200;
float preyY = 100;
float preyX = 50;
float predatorY = 400;
float predatorX = 400;
float easing = 0.05;
Prey myprey = new Prey();
Predator mypredator = new Predator();
OtherPrey preytwo = new OtherPrey();

void setup(){
  size(500,500);
}

void draw(){
  noStroke();
  background(200);
  fill(255,0,0);
  myprey.draw();
  fill(0,0,255);
  preytwo.draw();
  fill(255,255,0);
  mypredator.update();
  mypredator.draw();
  
  float waveSpeed = 0.1;
  float waveHeight = 5;
  preyY = 100 + sin(preyX * waveSpeed) * waveHeight;

  preyX = preyX + myprey.speed;
  opreyX = opreyX + preytwo.xspeed;
  opreyY = opreyY + preytwo.yspeed;
  
  if(opreyX > height || opreyX < 0){
     preytwo.xspeed *= -1;
  }
  
  if(opreyY < 0 || opreyY > height){
    preytwo.yspeed *=-1; 
  }
  
  if(preyX > height){
    myprey.speed *= -1; 
  }
  
  if(preyX < 0){
    myprey.speed *= -1;
  }
}

class Prey{
  float size = 50;
  float speed = 5;
  
  void draw(){
    ellipse(preyX,preyY,this.size,this.size); 
  }
}

class OtherPrey{
  float size = 50;
  float xspeed = 3.5; 
  float yspeed = 3.5;
  
  void draw(){
    ellipse(opreyX,opreyY,this.size,this.size); 
  }
}

class Predator{
  float size = 100;
  float speed = 10;
  
  void update(){
   float toX = preyX - predatorX;
   float toY = preyY - predatorY;
   
   if(dist(preyX, preyY, predatorX, predatorY) < 100){
     predatorX = predatorX + (toX*easing);
     predatorY = predatorY + (toY*easing);
   }
  
   float toanotherX = opreyX - predatorX;
   float toanotherY = opreyY - predatorY;
   
   if(dist(opreyX, opreyY, predatorX, predatorY) < 100){
     predatorX = predatorX + (toanotherX*easing);
     predatorY = predatorY + (toanotherY*easing);
   }
  }
  
  void draw(){
    ellipse(predatorX,predatorY,this.size,this.size); 
  }
}




