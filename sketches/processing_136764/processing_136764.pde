
// generates translation pattern, based on a bitmap tile
// Cc Andres Wanner, Feb 2014

int w=400; int h=400;
PImage myImg;
  
void setup () {
 size(w,h);
 background(220,220,220); 
 stroke(32,20,20); 
 smooth();
 myImg=loadImage("http://www.pixelstorm.ch/img/tile_01.png");
}

void draw() {
  for (int j=0; j<=80; j++) {
  translate(0,j*10);
  for (int i=0; i<=80; i++) {
      translate(i*10,0);
      figure();
      translate(i*-10,0);
  }
  translate(0,-j*10);
  }
}
 
void figure() {
   image(myImg,0,0);
}
