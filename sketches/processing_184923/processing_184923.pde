
      
    ArrayList <Bot> bots = new ArrayList <Bot> (); 
    PImage base;
    Base myBase1;
    Res myRes1;
    Water myWater1;
    
      void setup() {
      size(900, 600);
      base = loadImage("Space_station.jpg");
      myBase1 = new Base();
      myRes1 = new Res();
      myWater1 = new Water();
        
      bots = new ArrayList();
     
      for (int i = 0; i < 50 ; i++) {
        
       float x = random(-40, width - 40);
        float y = random(-40, height - 40);
       float m = random(5,15);
      float st = (random(1,5)/3);
      
      bots.add(new Bot(x,y,m));
    
        }
      
      }
      void draw() {
      background(0);
      fill(247,107,107);
       myBase1.script();
      myRes1.script();
      myWater1.script();
     
   
      image(base, 0,325,400,300);
        
         
      for (int i = 0; i< 50; i++) {
       Bot myBot = (Bot) bots.get(i);
        myBot.script();  
        myBot.locateRes(myRes1.getX(), myRes1.getY());
        myBot.locateWater(myWater1.getX(), myWater1.getY());
        
  
        myBot.script(); ///// THIS BLOCK WAS MISSING!
      }
      
      }   

  
 
class Base { 
float resourse = 3;
float water = 3;

PVector location;

Base () {
  location = new PVector (random (0, width), random (0, height));
  }
  
void life(){
water = water - 0.01;
location.x = water;
}

void repair(){
  resourse = resourse - 0.003;
  location.y = resourse;
}

void script(){
  life();
  repair();
}

float getX () {
  return location.x;
  }
  
float getY () {
  return location.y;
  }

}
  
  class Bot { 
  
  //color c;
  float storage; // maximum "value" of our bot 
  float m; //weight
  PVector location;
  PVector speed;
  
  PVector WaterLocation;
  PVector ResLocation;
  PVector BaseLocation;
  PVector target;
  
  float state = 0;
  
  Bot( float tempXpos, float tempYpos,  float tempm) { 
  m = tempm;
  location = new PVector (random (0, tempXpos), random (0, tempYpos));
  //speed = new PVector (random(1,5)/m, random(1,5)/m);
  speed = new PVector (10/m, 10/m);
  target = new PVector (50,50);
  
  
  
  //resourseLocation = new PVector (200,250); 
  //waterLocation = new PVector (30,40);
  
  }
  
  
  void setTarget (float x, float y) {
  target.x = x;
  target.y = y;
  
  }
  
  int atTarget(){
  if (abs(location.x - target.x) < 10 && abs(location.y - target.y) < 10) 
  return 1;
  else 
  return 0;
  }
  
  void display() {
  stroke(0);
  fill(255);
  ellipse(location.x, location.y, 6, 6);
  }
  
  void locateWater (float x, float y) {
  WaterLocation = new PVector(x, y);
  }
  
 void locateRes (float x, float y) {
  ResLocation = new PVector(x, y);
 }
 
 void changeState() {

if (BaseLocation.x < 3) state = 1;

if (state == 1) {setTarget (ResLocation.x, ResLocation.y);
}

}
  
  void move() {
  if (location.x > target.x) location.x = location.x - speed.x;
  if (location.x < target.x) location.x = location.x + speed.x;
  if (location.y > target.y) location.y = location.y - speed.y;
  if (location.y < target.y) location.y = location.y + speed.y;
  }
  
  void script(){
  
  //life();
  move();
  display();
  
  //changeState();
  }
  
  }
 class Res {
  
  int size = 40;
  PVector location;
 // PImage resourse;
  
  Res () {
  location = new PVector (random (0, width), random (0, height));
  }
  
  void display() {
  fill(68,240,100);
  ellipse(location.x,location.y,size,size);
  
  } 
  
  void script(){
  display();
  }
  
  float getX () {
  return location.x;
  }
  
  float getY () {
  return location.y;
  }
  
  }
  
  
class Water {
  int size = 40;
  PVector location;
  
  Water () {
  location = new PVector (random (0, width), random (0, height));
  }
  
  void display() { 
  
  fill (81,147,242);
  ellipse(location.x, location.y, size, size);
  
  } 
  
  void script(){
  display();
  }
  
  float getX () {
  return location.x;
  }
  
  float getY () {
  return location.y;
  }
  
  }


