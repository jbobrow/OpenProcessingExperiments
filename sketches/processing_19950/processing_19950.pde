
float orbit = -5;
 
void setup()
{
  size(500, 500);
  frameRate(120);
  background(0);
  colorMode(HSB);
}

void draw()
{
  noFill();
  stroke(orbit*15,250, 250, 15);
  orbit +=0.01;
  translate(width/2, height/2);
  rotate(orbit);
  curv(orbit*20,0, 200, 200, orbit*20);
   if(orbit>20)
  {
    noLoop();
}

}
 
void curv(float x, float y, float a, float b, float c)
{
    curveTightness(c);
  beginShape();
  curveVertex(x - a, y);
  curveVertex(x, y);
  curveVertex(x, y + b);
  curveVertex(x-b , y - b);
  endShape();
 
}



