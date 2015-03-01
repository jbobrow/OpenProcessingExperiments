
void setup()
{
  float t=5;
  size(1000,1000);
  background(10,200,70);
}

void draw()
{
  drawRandomEllipse();
  drawGrid();
}

void drawRandomEllipse()
{
  strokeWeight(random(10));
  stroke(random(255));
  fill(random(255),0,0);
  ellipse(mouseY,mouseX,random(750),random(750));
}

void drawGrid()
{
  for (int i = 140; i < 200; i = i+15) 
  {
    for (int j = 100; j < 180; j = j+15) 
    { 
    ellipse(i,j,5,5); 
    }
  }
}
void ellipsewhile()
{
  int t = 5;
  while (t < 80) {
  triangle(30, t, 80, t,30,30);
  t = t + 5;
  }
}  
