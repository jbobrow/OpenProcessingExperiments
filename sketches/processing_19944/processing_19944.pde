
float orbit = -5;
 
void setup()
{
  size(500, 500);
  frameRate(250);
  background(255);
  colorMode(HSB);
}

void draw()
{
  noFill();
  stroke(orbit*15,10, orbit/2, 25);
  orbit +=0.01;
  translate(width/2, height/2);
  rotate(orbit);
  Curv(orbit*20,0, 200, 200, orbit,"middle");
   if(orbit>=30)
  {
    noLoop();
}

}
 
void Curv(float x, float y, float a, float b, float c,String d )
{
  
if(d=="middle")
{
  y = y - b /9;
}
  curveTightness(c);
  beginShape();
  curveVertex(x , y);
  curveVertex(x, y-b/2);
  curveVertex(x, y );
  curveVertex(x-2*b , y );
  endShape();
 
}



