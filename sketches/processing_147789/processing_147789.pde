
import processing.pdf.*;

float r;
float g;
float b;
float alpha;

float triX1;
float triY1;
float triX2;
float triY2;
float triX3;
float triY3;

float lineX1;
float lineY1;
float lineX2;
float lineY2;
void setup() {
  size(500,500);
  frameRate(30);
   
  beginRecord(PDF, "triangles.pdf");
  background(0);
}

void draw () {

  
  triX1 = random(0, width);
  triY1 = random(0, height);
  triX2 = random(150,250);
  triY2 = random(150,250);
  triX3 = random(150,250);
  triY3 = random(150,250);
 r = random(0);
 g = random(150,256);
 b = random(150,256);
 alpha = random(50,250);
 noStroke();
  fill(r,g,b,alpha);
  
  triangle(triX1,triY1,triX2, triY2, 250, 250);
 lineX1 = random(0, width);
  lineY1 = random(0, height);
  lineX2 = random(2,8);
  lineY2 = random(2,8);
 r = (200);
 g = (0);
 b = (200);
 alpha = random(50,250);
 stroke(r,g,b,alpha);
  line(lineX1, lineY1, 250, 250);

}

void mousePressed() {
  endRecord();
  open(sketchPath("triangles.pdf"));
  noLoop();
}


