
uu//Matthew Quesada, Computer Programming 4-5
//Double Shapes

int y=1;

void setup()
{
  size(500, 500);
  background(255);
  frameRate(7);
  noLoop();
}

void draw()
{
  fill(0);
  rect(0,0,1000,1000);
  int x=1; 
  while (x<=y)

  {


    fill(0, random(100,255), random(100), 100);
    rect(random(450), random(450), 50, 50);
    x=x+1;
  }

  y=y*2;
}

void mousePressed()
{
  redraw();
}
