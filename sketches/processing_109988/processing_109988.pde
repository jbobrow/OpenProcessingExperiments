
void setup()
{
  size(800, 800);
  background(#FFFFFF);
}
void draw()
{
  for (int i= 0; i<width; i+=10)

  {
    smooth();
    noFill();
    beginShape();
    strokeWeight(1/20);

    stroke(255, 200, i);
    bezier(0, 0, 0, i, width, i, width, 0);
    bezier(0, height, 0, i, width, i, width, height);
    bezier(0, 0, i, 0, i, height, 0, height);
    bezier(width, 0, i, 0, i, height, width, height);
  }
}
void mousePressed()
{
  noLoop();
}



