
void setup()
{
  size(300, 300);
  background(51);
  noStroke();
  smooth();
  noLoop();
}

void draw()
{
  drawTarget(100, 100, 100, 10);
  drawTarget(100, 200, 100, 7);
  drawTarget(150, 150, 100, 3);
  drawTarget(200, 100, 100, 2);
  drawTarget(200, 200, 100, 50);
}

void drawTarget(int xloc, int yloc, int size, int num)
{
  float grayvalues = 255/num;
  float steps = size/num;
  for (int i=0; i<num; i++) {
    fill(i*grayvalues);
    ellipse(xloc, yloc, size-i*steps, size-i*steps);
  }
}


