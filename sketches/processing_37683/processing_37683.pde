

void setup()
{
  size(500, 500);
  background(255, 128, 113);
  smooth();
 
} 
  int cw = 40;
  int ch = 60;
  int r = -72;
  int z = 100;
  int n = 100;
  
void draw()
{
  for (z = 90; z < width; z += 160)
  {
    for (n = 90; n < height; n += 160)
    {
     flower(z, n);
     highlight(z, n);
    }
  }
}

void flower(int x, int y)
{
  pushMatrix();
  strokeWeight(1);
  stroke(230, 40, 100);
  fill(230, 40, 100);
  
  translate(x, y);
  rotate(radians(r));
  ellipse(20, 30, cw, ch); //petal 2
  
  rotate(radians(r));
  ellipse(10, 50, cw, ch); //petal 3
  
  rotate(radians(r));
  ellipse(-10, 50, cw, ch); // petal 4
  
  rotate(radians(r));
  ellipse(-20, 30, cw, ch); // petal 5
  
  rotate(radians(r));
  ellipse(0, 20, cw, ch); //petal 1
  
  fill(255, 215, 115);
  ellipse(0, -20, 20, 20); // center of flower
  popMatrix();
}
int hcw = 10;
int hch = 30;

void highlight(int x, int y)
{
  pushMatrix();
  strokeWeight(1);
  stroke(240, 60, 100);
  fill(250, 60, 100);
  
  translate(x, y);
  rotate(radians(r));
  ellipse(20, 30, hcw, hch); //petal 2
  
  rotate(radians(r));
  ellipse(10, 50, hcw, hch); //petal 3
  
  rotate(radians(r));
  ellipse(-10, 50, hcw, hch); // petal 4
  
  rotate(radians(r));
  ellipse(-20, 30, hcw, hch); // petal 5
  
  rotate(radians(r));
  ellipse(0, 20, hcw, hch); //petal 1
 
  popMatrix();
}
           
