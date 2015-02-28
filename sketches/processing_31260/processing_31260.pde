
Shoe theirs1 =  new Shoe(400, 100, 50, 50,5, color(0));
 side them1 =  new side(250, 100, 50, 50,2, color(0));
 Shoe his1 =  new Shoe(390, 100, 50, 50,3, color(0));
 side mine1 =  new side(300, 100, 50, 50, 4,color(0));
Shoe theirs =  new Shoe(40, 100, 50, 50,5, color(0));
 side them =  new side(150, 100, 50, 50,6, color(0));
 Shoe his =  new Shoe(100, 100, 50, 50,7, color(0));
 side mine =  new side(480, 100, 50, 50, 8,color(0));
 
void setup(){
  size(500, 500);
  background(255);
  frameRate(200);
 
}
void draw(){
  background(255);
  mine.drive();
  mine.display();
  his.drive();
  his.display();
 them.drive();
  them.display();
theirs.drive();
  theirs.display();
    mine1.drive();
  mine1.display();
  his1.drive();
  his1.display();
 them1.drive();
  them1.display();
theirs1.drive();
  theirs1.display();
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
  if(y>490){
     speed = -speed;
   
}
if(y<0){
  speed = -speed;
}
 
  
}
  
  
  
 }
 
 
 
 
 
 
 class side {
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
 
  side(int x, int y, int w, int h,int spd, color c){
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
  if(x>490){
     speed = -speed;
   
}
if(x<0){
  speed = -speed;
}
 
  
}
  
  
  
 }
