
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
float p;
float s;
int speed;
  
  
Shoe(int x, int y, int w, int h,int spd,color c){
  
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
speed = spd;
}
  
void display(){
fill(col);
rect (xPos, y, wid, hei);
}

void drive() {
 y= y+ speed;
 

 
 if(y>490) {
   speed = -speed;
 }
  if(y<0) {
   speed = -speed;
}
}
}
Shoe hers = new Shoe(5, 10, 30, 20, 2, color(67,30,100));
 Shoe mine =  new Shoe(100, 100, 50, 50, 2, color(0));
 
void setup(){
  size(500, 500);
  background(random(255), random(255), random(255));
  frameRate(200);
 
}
void draw(){
  background(0, 0, 255);
  mine.drive();
  mine.display();
 hers.display();
}

