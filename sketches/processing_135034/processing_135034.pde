
PImage forest;

float preyY = 90;
float preyX = 30;
float preyY2 = 350;
float preyX2 = 180;
float predatorY = 30;
float predatorX = 50;

float easing = 0.07;

class Prey{
  float size = 60;
  float speed = 5;
   PImage img;
  
  Prey()
  {
    this.img= requestImage("tiger.jpg");
  }
  void draw(){
    image(img,preyX,preyY,this.size,this.size);
  }
}
 
class Prey2{
  float size = 50;
  float xspeed = 3.5;
  float yspeed = 3.5;
  PImage img2;
   
   Prey2()
   {
     this.img2=requestImage("bear.jpg");
   }
   
  void draw(){
    image(img2,preyX2,preyY2,this.size,this.size);
  }
}
 
class Predator{
  float size = 130;
  float speed = 7;
   PImage img3;
   
   Predator()
   {
     this.img3=requestImage("predator.jpg");
   }
  void update(){
   float toX = preyX - predatorX;
   float toY = preyY - predatorY;
    
   if(dist(preyX, preyY, predatorX, predatorY) < 95){
     predatorX = predatorX + (toX*easing);
     predatorY = predatorY + (toY*easing);
   }
   
   float toanotherX = preyX2 - predatorX;
   float toanotherY = preyY2 - predatorY;
    
   if(dist(preyX2, preyY2, predatorX, predatorY) < 95){
     predatorX = predatorX + (toanotherX*easing);
     predatorY = predatorY + (toanotherY*easing);
   }
  }
   
  void draw(){
   fill(0);
    image(img3,predatorX,predatorY,this.size,this.size);
    
  }
}

Prey myprey = new Prey();
Predator mypredator = new Predator();
Prey2 myprey2 = new Prey2();

void setup(){
  size(500,500);
  forest =requestImage("forest.jpg");
  
}
 
void draw(){
  image(forest,0,0);
  myprey.draw();
  myprey2.draw();
  mypredator.update();
  mypredator.draw();
   
  float waveSpeed = 0.07;
  float waveHeight = 5;
  preyY = 80 + sin(preyX * waveSpeed) * waveHeight;
 
  preyX = preyX + myprey.speed;
  preyX2 = preyX2 + myprey2.xspeed;
  preyY2 = preyY2 + myprey2.yspeed;
   
  if(preyX2 > height || preyX2 < 0){
     myprey2.xspeed *= -1;
  }
   
  if(preyY2 < 0 || preyY2 > height){
    myprey2.yspeed *=-1;
  }
   
  if(preyX > height){
    myprey.speed *= -1;
  }
   
  if(preyX < 0){
    myprey.speed *= -1;
  }
}
 



