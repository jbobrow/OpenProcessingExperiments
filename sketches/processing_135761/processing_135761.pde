
PImage park;
PImage gravestone;
float timer=0.0;

float preyY =100;
float preyX =150;
float predatorY =30;
float predatorX=80;
float dogX= 100;
float dogY= 350;


float easing = 0.06;

Prey myprey= new Prey();
Predator mypredator = new Predator();
Dog mydog = new Dog();



void setup(){
  size(500,500);
  park =requestImage("park.jpg");
  gravestone=requestImage("grave2.png");
  frameRate(30);
  
}
void draw(){
  timer= timer+(1.0/30.0);
  
  println(timer);
  image(park,0,0,width,height);
  myprey.draw();
  mypredator.update();
  mypredator.draw();
  mydog.draw();
  
  preyX = preyX + myprey.speed;
  preyY = preyY + myprey.speed2;
  if(preyX> height || preyX<0)
  {
    myprey.speed*=-1;
  }
  if(preyY<0 || preyY> height){
    myprey.speed2*=-1;
  }
if(timer>20.5)
{
  preyY=-200;
  preyX=-200;
  image(gravestone,300,350,80,80);
}
if(timer>43){
image(gravestone,100,350,80,80);}
}

class Prey{
  float size = 80;
  float speed=4;
  float speed2=5;
  PImage img;
  
  Prey()
  {
    this.img= requestImage("deer.png");
  }
  void draw(){
    image(img,preyX,preyY,this.size,this.size);
  }
}
class Predator{
  float size=130;
  float speed=4;
  PImage img2;
  
  Predator()
  {
    this.img2= requestImage("predator.png");
  }
 void update(){
   float toX=preyX- predatorX;
   float toY=preyY-predatorY;
   
   if(dist(preyX,preyY,predatorX,predatorY) < 120){
     predatorX= predatorX+ (toX*easing);
     predatorY= predatorY+ (toY*easing);
   }
 }
  void draw(){
    image(img2,predatorX,predatorY,this.size,this.size);
 if(timer>20.5)
 {
   size=180;
   predatorX=350;
   predatorY=60;
  }
  if(timer>23)
  predatorY=predatorY+300;
}
}
class Dog{
  float size=80;
  float speed =4;
  float rad=0.0;
  PImage img3;
  
  Dog()
  {
    this.img3= requestImage("dog.png");
  }
  void draw(){
    pushMatrix();
    rad=rad+0.1;
    rotate(rad);
    image(img3,dogX,dogY,this.size,this.size);
    
    if(timer>10){
      rad=rad-0.04;
    }
    if(timer>20){
      rad=rad-0.02;
    }
    if(timer>25){
      rad=rad-0.02;
    }
    if(timer>40){
      rad=0;
    }
    if(timer>41.5){
      dogX=-200;
      dogY=-200;
    }
    if(timer>45){
      filter(GRAY);
    }
 popMatrix();
  }
  
  
  
}
  
  




