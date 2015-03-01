

void setup()
{
  size(1000,1000);
  colorMode(HSB, 360, 100, 100);
  background(0,0,100);
  noStroke();
}

void draw()
{
  
  drawLeaf(width/2, height/2, 23, random(-width/10, width/10), random(-height/10, height/10), random(-PI, PI), random(1,2));
  drawLeaf(width/2, height/2, 41, random(width), random(height), random(-PI, PI), random(0.5, 1));
}

void mousePressed()
{
  background(0,0,100);
}

void drawLeaf(float CX, float CY, float H, float X, float Y,float degree, float s)
{
  pushMatrix();
  translate(CX, CY);
  float t= random(-20, 20);
  rotate(degree);
  scale(s);
  fill(H, random(0, 100), random(0, 100),200);
  beginShape();
  vertex(20+X, 45+Y); 
  bezierVertex(30+X, 30+Y, 60 + t+X, 40 + t/2+Y, 70 + t+X, 50+Y);
  bezierVertex(60 + t+X, 55+Y, 30+X, 65+Y, 20+X, 45+Y); 
  endShape();
  popMatrix();  
}

