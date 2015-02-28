


PImage b;

float w;
float h;
float r;
float g;
float a;
float diam;
float x;
float y;

void setup() {

  b=loadImage("blue.jpg");
  size (640, 480);
  frameRate(1);
}


void draw() { 
  image(b, 0, 0);
  strokeWeight(50);
  smooth();
  ellipse (x, y, diam, diam);


  r=random (0);
  g=random(255);

  a=random(0);
  diam=random(25);
  x=random(width);
  y=random(height);
  w=random(width);
  h=random(height);


  if ((mouseX>width/2-25 )&& (mouseX<width/2+25) && (mouseY>height/2-25) && (mouseY<height/2+25)  ) {
    stroke(247, 170, 122);
  }
  else {
    stroke(255, 255, 155);
  }

  point(width/2, height/2); 

  if ((mouseX>width/4-25 )&& (mouseX<width/4+25) && (mouseY>height/4-25) && (mouseY<height/4+25)  ) {
    stroke(247, 170, 122);
    //print("anything");
  }
  else {
    stroke(255);
  }

  point(width/4, height/4);

  if ((mouseX>width/8-25 )&& (mouseX<width/8+25) && (mouseY>height/8-25) && (mouseY<height/8+25)  ) {
    stroke(255);
    //print("anything");
  }
  else {
    stroke(247, 170, 122);
  }
  point(width/8, height/8);
}
void mousePressed() {
  endRecord();
  noLoop();
}


