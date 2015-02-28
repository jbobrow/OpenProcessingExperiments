
 Shoe hers = new Shoe(20, 20, 30, 20,4, color(255,255,255));
 Shoe mine =  new Shoe(100, 100, 100, 100,30, color(0));
 Breyon his = new Breyon(100, 100, 100, 100,30, color(0));
void setup(){
  size(500, 500);
  background(256, 176, 232);
  frameRate(20);
 
}
void draw(){
  background(255, 255, 255);
  mine.drive();
  mine.display();
  his.drive();
  his.display();
 hers.display();
 hers.drive();
 
}

class Shoe {
int xPos;
int yPos;
int wid;
int hei;
color col;
int y;
int x;
float z;
float t;
float a;
float c;
int speed=10;
 
  Shoe(int x, int y, int w, int h,int spd, color c){
  xPos = x;
  yPos = y;
  wid = w;
  hei = h;
  col = c;
  speed=spd;
}
 
void display() {
  fill(col);
  rect (xPos, y, wid, hei);
}
 
 
void drive(){
 
  
  y=y+speed;
    
   
   
  if(y>490){
     speed = -speed;
   
}
if(y<0){
  speed = -speed;
}
 
  
}
  
  
  
 }
  
class Breyon {
int xPos;
int yPos;
int wid;
int hei;
color col;
int y;
int x;
float z;
float t;
float a;
float c;
int speed=10;
 
  Breyon(int x, int y, int w, int h,int spd, color c){
  xPos = x;
  yPos = y;
  wid = w;
  hei = h;
  col = c;
  speed=spd;
}
void display() {
  fill(col);
  rect (x, yPos, wid, hei);
}
 
 
void drive(){
 
  
  x=x+speed;
    
   
   
  if(x>490){
     speed = -speed;
   
}
if(x<0){
  speed = -speed;
}
 
  
}
  
  
  
 }
  


