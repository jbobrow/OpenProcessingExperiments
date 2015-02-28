
// Ryanne Hollies
// PS3-5

PImage im; 
float maxA = 65.0;
float minS = 2.0;

void setup() {
  size(512,512);
  im=loadImage("house.png");
  background(0);
}
 
void mouseMoved() {
  maxA = mouseY/8.0;
  minS = 11.0-(mouseX/51.2);
}
 
void draw() {
  splitImage(0,0,512,512);
}



