
//Tomas de Camino
//Use de llamadas recursivas para crear fractal

float iniSize, angle;
void setup()
{
  size(600, 600);
  iniSize = 50;
  background(0);
  smooth();
}
 
void draw()
{
  background(50);
  fill(255,200);
  angle = radians((mouseX / (float) width) * 90);
  translate(width/2, height-200);
  rect(0,0,iniSize,iniSize);
  recursiveRect(iniSize);
}
 
void recursiveRect(float s)
{
  float newSide = (s*sqrt(3))/2;
  if (newSide > 2)
  {
    pushMatrix();
    rotate(-angle);
    rect(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

