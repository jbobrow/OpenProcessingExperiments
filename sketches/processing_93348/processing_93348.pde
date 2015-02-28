
// Loris Uzan
// 3/19/2013


Line hello = new Line(30,30,900,900);
Lineone helloone = new Lineone(0,0,300,300);
float x1=0;
float x2=0;
class Line{
  float x;
  float y;
  float w;
  float v;
  float speed;
  
  Line(float startX, float startY, float startW, float startV){
    x=startX;
    y=startY;
    w=startW;
    v=startV;
    speed=4;
  }
  
  void move() {
    x=x+speed;
    w=w+speed/5;
  }
  
  void display () { 
    line(x,y,w,v);
  }
}

class Lineone{
  float x;
  float y;
  float w;
  float v;
  float speed;
  
  Lineone(float startX, float startY, float startW, float startV){
    x=startX;
    y=startY;
    w=startW;
    v=startV;
    speed=4;
  }
  
  void move() {
    y=y+speed;
    v=v+speed/5;
  }
  
  void display () { 
    line(x,y,w,v);
  }
}


void setup() {
  size(1600,900);
  background(50);
}

void draw(){ 
  
  hello.display();
  hello.move();
  helloone.display();
  helloone.move();
  
  stroke(0);
  line(x1,0,x1,900);
  x1=x1+2;
  line(x2,0,x2,900);
  x2=x2+5;
  
  
  
  
}





