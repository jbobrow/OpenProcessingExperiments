
float orbit = -5;
 
void setup()
{
  size(500, 500);
  frameRate(100);
  background(255);
  colorMode(HSB);
}

void draw()
{
  noFill();
  stroke(orbit*15,100, 100, 25);
  orbit +=0.05;
  translate(width/2, height/2);
  rotate(orbit);
  curv(orbit*20,0, 200, 200, orbit,"middle");
  if(orbit>87)
  {
    noLoop();
}
}
 
void curv(float x, float y, float a, float b, float c,String d )
{
  
if(d=="middle")
{
   x = x - x/2 ;
}
  curveTightness(c);
  beginShape();
  curveVertex(x , y);
  curveVertex(x, y-b/2);
  curveVertex(x, y );
  curveVertex(x-2*b , y );
  endShape();
 
}



