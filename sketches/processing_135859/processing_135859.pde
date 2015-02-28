
/**
 *
 * Random rectangles along a diagonal
 * 
 **/

void drawrect() {
  
  int len = width;
  int initPoint = 0;
  
  while(len > 1) {
    int ran = (int)random(0, len);
    rect(initPoint, initPoint, ran, ran);
    len -= ran;
    initPoint += ran;
  }
}


void setup(){
  
  size(640, 640, OPENGL);
  frameRate(1);

}

void draw(){
  
  fill(255,0,0);
  background(0); 
  drawrect();

}


