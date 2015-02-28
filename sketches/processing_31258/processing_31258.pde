
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
int speed=8;

  Shoe(int x, int y, int w, int h, int speed, color c){
  xPos = x;
  yPos = y;
  wid = w;
  hei = h;
  col = c;

}
 
void display(){
fill(col);
rect (xPos, yPos, wid, hei);
}
void drive() {
  y = y+speed;
 fill(100);
 rect (x,y,wid,hei);



  if (y>490) {
speed= -speed;

}
if (y<1) {
speed= -speed;
}
  
  
}}


