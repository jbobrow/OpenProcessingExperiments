
 Shoe hers = new Shoe(5, 10, 30, 20, 2, color(67,30,100));
 Shoe mine =  new Shoe(100, 100, 50, 50, 5, color(8,22,133));
 Sideshoe whee = new Sideshoe(100, 50, 30, 50, 3, color(233,212,111));
 Sideshoe omg = new Sideshoe(230, 220, 100, 50, 6, color(34,223,244));
 Diagonalshoe ohyeah = new Diagonalshoe(230, 112, 70, 23, 8, color(77,23,44));
 
void setup(){
  size(500, 500);
  background(random(255), random(255), random(255));
  frameRate(200);
 
}
void draw(){
  background(0, 0, 255);
  mine.drive();
  hers.drive();
  whee.drive();
  omg.drive();
  ohyeah.drive();
  mine.display();
 hers.display();
 whee.display();
 omg.display();
 ohyeah.display();
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
int speed;
 
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
 
y = y+speed;

 
  
    
   
   
  if(y>height){
     speed = -speed;
   }

if(y<0){
  speed = -speed;
}
 
  
}

}


  
  
  
  
  class Sideshoe {
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
int speed;
 
  Sideshoe(int x, int y, int w, int h,int spd, color c){
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
 
x = x+speed;

 
  
    
   
   
  if(x>height){
     speed = -speed;
   
  }
if(x<0){
  speed = -speed;
}
 
  
}
  
 } 
  
  
  
  
  
  
class Diagonalshoe {
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
int speed;
 
  Diagonalshoe(int x, int y, int w, int h,int spd, color c){
  xPos = x;
  yPos = y;
  wid = w;
  hei = h;
  col = c;
  speed=spd;
}
 
void display() {
  fill(col);
  rect (x, y, wid, hei);
}
 
 
void drive(){
 
x = x+speed;
y=y+speed;

 
  
    
   
   
  if(x>height){
     speed = -speed;
}
  if(y>height){
    speed = -speed;
   
}
  if(x<0){
    speed = -speed;
}
  if(y<0){
    speed = -speed;
  
}
  
  
  
 }
 
}  
 


  
