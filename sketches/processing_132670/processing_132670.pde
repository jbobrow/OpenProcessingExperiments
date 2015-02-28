
int imgSize = 15;

import processing.video.*;
Capture C;
int X=0;

void setup(){
  colorMode(HSB, 100);
  C = new Capture(this, 320,240);
  size(320,240);
  C.start();
  frameRate(4);
}
void draw() {

  background(#FFFFFF);
  if(C.available()) {
    C.read();
   C.filter(BLUR,5);
   C.filter(ERODE);
  
  //image(C,0,0);
  
  for (int i=0; i<C.width; i+=imgSize){
    for (int j=0; j<C.height; j+=imgSize){
      color c = C.get(i,j);
      noStroke();
      fill(c*5, 10);
      rect (i,j,imgSize/1.3,height);
      fill(c/5, 10);
      rect (i,j,width,imgSize/1.3);
      
    }
  }
}
}


