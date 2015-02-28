
void setup() 
{
  size(500, 500);
  background(176,43,234);
  noStroke();
  smooth();
  noLoop();
}

void draw() 
{
  drawTarget(200, 300, 300, 50);
  drawTarget(300, 400, 100, 50);
  drawTarget(300, 144, 80, 50);
}

void drawTarget(int xloc, int yloc, int size, int num) 
{
  float grayvalues = 255/num;
  float steps = size/num;
  for(int i=0; i<num; i++) {
    fill(i*grayvalues,30,245,100);
    ellipse(xloc, yloc, size-i*steps, size-i*steps);
  }
}

