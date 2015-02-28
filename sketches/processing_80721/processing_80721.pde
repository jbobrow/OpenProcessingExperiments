
float sepMult = 2;
PImage img;
void setup() {
  img = loadImage("01.jpg");
  size(800, 800);
  smooth();
}
void draw() {
  background(0);
  //  image(img, 0, 0,200,200);
  image(img, 0, 0);
  // i=i-1;
  //two for loops for 
  sepMult= sepMult-0.05;
  for (int i=0; i<50; i++) {
    line(0, height/2 +(i*sepMult), width, height/2+(sepMult*i));
  } 
  for (int i=0; i<70; i++) {
    line(0, height/2 -(i*sepMult), width, height/2-(sepMult*i));
  }
}



