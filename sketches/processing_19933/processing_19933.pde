
float orbit = -15;
 
void setup()
{
  size(700, 700);
  frameRate(80);
  background(255);
  colorMode(HSB);
}

void draw()
{
  noFill();
  stroke(orbit*15,150, 140, 15);
  orbit +=0.01;
  translate(width/2, height/2);
  rotate(orbit);
  Curv(orbit*20, 0, 200, 200, orbit, "middle");//calling the curv function

}
 
void Curv(float x, float y, float b, float h, float t, String m)
{
  if(m == "middle")
  {
    x = x - b / 2;
    y = y - h /2;
  }
  curveTightness(t);
  beginShape();
  curveVertex(x + b, y);
  curveVertex(x, y);
  curveVertex(x, y + h);
  curveVertex(x , y + h);
  endShape();
}


