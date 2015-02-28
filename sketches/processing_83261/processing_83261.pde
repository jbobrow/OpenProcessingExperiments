

void setup()
{
  size (1000,800);
  background(172,72,27);
  smooth();
  

}
 void draw()
{
  fill(0,255,0);
  ellipse (323, 543,389,256);
  fill(random(255),200,50);
  triangle(random(width), 300,553,500,mouseX,mouseY);
}

