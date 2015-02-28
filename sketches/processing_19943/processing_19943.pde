
float orbit = -5;
void setup()
{
  size(500, 500);
  frameRate(80);
  background(255);
  colorMode(HSB);
}

void draw()
{
  noFill();
  stroke(orbit*15,100, 100, 25);
  orbit +=0.01;
  translate(width/2, height/2);
  rotate(orbit);
  Curv(orbit*20,0, 200, 200, orbit*20);
 if(orbit >= 45) 
 {
 noLoop();
 }
}
 
void Curv(float x, float y, float a, float b, float c)
{
  y = y - b /9;
  curveTightness(c);
  beginShape();
  curveVertex(x-b/2 , y);
  curveVertex(x+2*b, y-b/2);
  curveVertex(x, y );
  curveVertex(x-2*b , y );
  endShape(); 
}



