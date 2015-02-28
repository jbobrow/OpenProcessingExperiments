
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
int speed=3;
class Shoe {
  Shoe(int x, int y, int w, int h, color c){
  xPos = x;
  yPos = y;
  wid = w;
  hei = h;
  col = c;
}

void display() {
  fill(col);
  rect (xPos, yPos, wid, hei);
}


void drive(){
x = y+0;
y = x+speed;
if(y>499) {
    y=speed;
    fill(255);
   rect (250, y, wid, hei);
   
  
  }
  {
  if(y>490){
     speed = -speed;
  
}
if(y<0){
  speed = -speed;
}

 
 
 
 
 
 }
 
 
  Shoe hers = new Shoe(5, 10, 30, 20, color(67,30,100));
 Shoe mine =  new Shoe(100, 100, 50, 50, color(0));

void setup(){
  size(500, 500);
  background(random(255), random(255), random(255));
  frameRate(3);

}
void draw(){
  mine.display();
 hers.display();
}
