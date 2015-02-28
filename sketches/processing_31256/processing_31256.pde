
class Shoe{
int xPos;
int yPos;
int wid;
int hei;
int x;
int y;
int speed;
color col;

 Shoe(int x, int y, int w, int h, int spd, color c){
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
speed = spd;

}
  


  
void display(){
fill(255);
rect (xPos, y, wid, hei);
}
 
void drive(){
  y = y+speed;
  
  if(y > 450) {
  speed=-speed;
}
  if(y < 1) {
    speed=-speed;
  }
}
}
  Shoe mine = new Shoe(100, 10, 30, 40, 2, color(255,255,255));
  Shoe his = new Shoe(10,100,50,50, 50, color(0));
 
  void setup(){
   size(500,500);
   background(0,0,0);
   frameRate(20);
 }
                
void draw(){
  background(0,0,  255);
  mine.drive();
  mine.display();
  his.drive();
  his.display();
}
