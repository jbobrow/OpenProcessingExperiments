
//Tomas de Camino
//Use de llamadas recursivas para crear fractal
 
float iniSize, angle;
void setup()
{
  size(600, 600);
  iniSize = 50;
  background(255);
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
  recursiveRect2(iniSize);
  recursiveRect3(iniSize);
  recursiveRect4(iniSize);
  recursiveRect5(iniSize);
}
  
void recursiveRect(float s)
{
  float newSide = (s*sqrt(3))/2;
  if (newSide > 20)
  {
    pushMatrix();
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

void recursiveRect2(float s)
{
  float newSide = (s*sqrt(30))/2;
  if (newSide > 2)
  {
    pushMatrix();
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

void recursiveRect3(float s)
{
  float newSide = (s*sqrt(50))/2;
  if (newSide > 20)
  {
    pushMatrix();
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

void recursiveRect4(float s)
{
  float newSide = (s*sqrt(50))/2;
  if (newSide > 40)
  {
    pushMatrix();
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

void recursiveRect5(float s)
{
  float newSide = (s*sqrt(10))/2;
  if (newSide > 4)
  {
    pushMatrix();
    rotate(-angle);
    ellipse(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

