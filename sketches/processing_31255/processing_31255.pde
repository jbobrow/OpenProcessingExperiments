
class Circle{
int xPos;
int yPos;
int wid;
int hei;

int speed;
color col;

 Circle(int x, int y, int w, int h, int spd, color c){
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
speed = spd;

}

void display(){
  fill(0);
  ellipse( xPos,  yPos,  wid,  hei);
}

void drive(){
  xPos = xPos+speed;
  
  if(xPos > width) {
    speed=-speed;
  }
  
  if(xPos < 1) {
    speed=-speed;
  }
}
}
Circle mine = new Circle(100, 10, 30, 40, 2, color(random(255),random(255),random(255)));

void setup(){
  size(500,500);
  background(0, 0, 0);
  frameRate(50);
}

void draw(){
  background(0,0,255);
  mine.drive();
  mine.display();
}
