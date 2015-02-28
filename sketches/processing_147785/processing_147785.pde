
import processing.pdf.*;

float r;
float g;
float b;
float alpha;

float lineX1;
float lineY1;
float lineX2;
float lineY2;

float rectX;
float rectY;
float rectWidth;
float rectHeight;

void setup() {
  size(500,500);
  frameRate(30);
  beginRecord(PDF, "shani.pdf");
  background(0);
}

void draw () {
 
  lineX1 = random(0, width);
  lineY1 = random(0, height);
  lineX2 = random(2,8);
  lineY2 = random(2,8);
 r = (23);
 g = (100);
 b = (200);
 alpha = random(50,250);
 stroke(r,g,b,alpha);
  line(lineX1, lineY1, 250, 250);

 rectX = random(0, width);
  rectY = random(0, height);
  rectWidth = random(5,20);
  rectHeight = random(5,20);
 r = (256);
 g = (123);
 b = (50);
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


