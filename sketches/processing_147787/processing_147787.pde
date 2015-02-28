
import processing.pdf.*;

float rectX;
float rectY;
float rectWidth;
float rectHeight;
float r;
float g;
float b;
float alpha;


void setup() {
  size(500,500);
   frameRate(30);
  beginRecord(PDF, "shani.pdf");
    background(50);
}

void draw () {

 
 
  rectX = random(0, width);
  rectY = random(0, height);
  rectWidth = random(5,20);
  rectHeight = random(5,20);
 r = random(0,256);
 g = random(0,256);
 b = random(0,256);
 alpha = random(50,250);
 stroke(r,g,b,alpha );
 noFill();
  rect(rectX, rectY, rectWidth, rectHeight);
  
}

void mousePressed() {
  endRecord();
  open(sketchPath("shani.pdf"));  
  noLoop();
}


