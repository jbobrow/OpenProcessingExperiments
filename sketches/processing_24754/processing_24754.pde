
int num = 6;
float rectSize = random(100);
 
Rect[] myRect = new Rect[num];
color[] myColors = new color [3];
 
void setup() {
 
  size(300,300);
 
  myColors[0] = color(255,0,0,50);
  myColors[1] = color(0,255,0,50);
  myColors[2] = color(0,0,255,50);
 
  for(int i=0; i<myRect.length; i++) {
    myRect[i] = new Rect();
  }
  noStroke();
  rectMode(CENTER);
}
void draw() {
  background(255);
 
  for(int i=0; i<myRect.length; i++) {
    myRect[i].update();
    myRect[i].draw();
  }
}
 
class Rect {
 
  float x = random(20, width-20) ;
  float y = random(20, height-20) ;
  color col = myColors[floor(random(0,3))] ;
  float rectSize = random(100) ;
 
  Rect() {
  }
 
  void update() {
    rectSize++;
    if (rectSize > width) {
      rectSize = 1;
       
    }
  }
 
    void draw() {
      fill(col) ;
      rect(x,y,rectSize,rectSize) ;
    }
  }


