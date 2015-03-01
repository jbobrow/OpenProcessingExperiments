
int rOsc = 0;
int gOsc = 50;
int bOsc = 100;
int colorIncrement;
int shape1 = 5;
int shapeSpeed = 1000;
PImage img;

void setup() {
  size(800, 800, P3D); 
  img = loadImage("term1.bmp");
  background(img);
}

void draw() {
 // background(200);
  image(img,0,0);
  stroke(255, 50);
  translate(400, 400, 400);
  rotateX(frameCount * 0.005);
  rotateY(frameCount * 0.005);
  fill(rOsc/2, gOsc/2, bOsc/2, 200);
  sphereDetail(shape1/shapeSpeed);
  sphere(130);
  
  //increment speeds
  rOsc++;
  gOsc = gOsc+2; 
  bOsc = bOsc+3;
  shape1++;
  
  //geometry/color looping
  if (rOsc >= 200) rOsc =0;
  if (gOsc >= 200) gOsc =0;
  if (bOsc >= 255) bOsc =0;
  if (shape1/shapeSpeed >= 10) shape1 =5;
}




