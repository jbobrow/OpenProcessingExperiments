
void setup()
{
  size(800,800);
  background(255);
  noStroke();
}
 
void draw()
{
  deadFLOWER(width/2, height/2, 10, random(width/10, width/10), random(height/10, height/10), random(-PI/2, PI), random(1,5));
  deadFLOWER(width/2, height/2, 20, random(width), random(height), random(-PI, PI), random(0.04, 2));
}
 
void mousePressed()
{
  colorMode(RGB);
  background(53,228,250);
}
 
void deadFLOWER(float HA, float HE, float H, float X, float Z,float degree, float u)
{
  pushMatrix();
  translate(HA, HE);
  rotate(degree);
  float t= random(-20, 20);
  colorMode(HSB, 300, 200, 100);
  fill(H, random(50, 250), random(100, 300),250);
  beginShape();
  vertex(20, 20);
  bezierVertex(65 + t+X, 50+Z, 35+X, 65+Z, 25+X, 50+Z);
  endShape();
  
  popMatrix(); 
}

