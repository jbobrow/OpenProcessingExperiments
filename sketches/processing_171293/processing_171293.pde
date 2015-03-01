
float R=150;
float tx=0;
float ty=0;
float T=15;
void setup()
{
  size(600, 600);
  frameRate(10);
  colorMode(HSB, 360, 100, 100);
}

void leaf(float CX, float CY, float X, float Y, float degree)
{ 
  pushMatrix();
  translate(CX, CY);
  float t= random(-10, 10);
  rotate(degree);
  noStroke();
  fill(random(20, 86), random(50, 100), random(60, 100));
  beginShape();
  vertex(20+X, 45+Y);
  bezierVertex(20+X, 10+Y, 60 + t+X, 20 + t/2+Y, 70 + t+X, 30+Y);
  bezierVertex(60 + t+X, 55+Y, 30+X, 65+Y, 20+X, 45+Y);
  endShape();
  popMatrix();
}

void draw()
{ 
  background(255, 10);

  if (mousePressed)
  {
    tx=random(0, width);
    ty=random(0, height);
  }
  float a=tx;
  float b=ty; 
  fill(360, 100, 100);
  beginShape();
  vertex(a, b);
  bezierVertex(a+3, b-20, a+20, b-3, a, b+10);
  bezierVertex(a-20, b-3, a-3, b-20, a, b);
  endShape();


 
  for (float x=0; x<width; x+=T) {
    for (float y=0; y<height; y+=T) {
      if ((mouseX-R>x)||(mouseX+R<x)||(mouseY-R>y)||(mouseY+R<y)) {
        leaf(x, y, random(20, 50), random(20, 50), random(0, PI));
      }
    }
  }
}

