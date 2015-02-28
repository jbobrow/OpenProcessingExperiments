
//import processing.pdf.*;
float w;
float h;
float r;
float g;
float b;
float a;
float diam;
float x;
float y;

void setup (){
  size (800,800);
  //beginRecord(PDF, "myfile.pdf");//name file something
  background (255);
  frameRate(10);
  
  
}

void draw (){
  //noStroke();
  smooth ();
  fill (r, g, b, a);
  ellipse (x, y, diam, diam);
  rect (w, h,diam,diam);
  
  r=random (255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(60);
  x=random(width);
  y=random(height);
  w=random(width);
  h=random(height);
}

void mousePressed(){
  endRecord();
  noLoop();
}
//void mouseReleased(){
  //loop();
//}

  

