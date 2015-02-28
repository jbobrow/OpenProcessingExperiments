
void setup(){
  size(400,400);
  background(0);
  strokeWeight(10);
  frameRate(30);
}
int x = 200;
int y = 200;
int r = 127;
int g = 127;
int b = 127;
void draw(){
  background(0);
  stroke(r,b,g);
  point(x,y);
  x=(x+int (random(-5,5)))%400;
  y=(y+int (random(-5,5)))%400;
  r=(r+int (random(-30,30)))%256;
  b=(b+int (random(-30,30)))%256;
  g=(g+int (random(-30,30)))%256;
  stroke(r,b,g);
  point(x,y);
}
  
  

