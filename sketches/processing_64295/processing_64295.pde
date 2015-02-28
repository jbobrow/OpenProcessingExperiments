

float x_val;   // the x value of each point
float y_val;   // the y value of each point
void setup()
{
    size(400,400);
    strokeWeight(6);
    frameRate(4);
    colorMode(HSB);
}

  void drawCross()
{
  point(x_val,y_val);
  point(x_val,y_val+10);
  point(x_val,y_val-10);
  point(x_val+10,y_val);
  point(x_val-10,y_val);
}




void draw()
{
  background(0);
  stroke(random(255),255,255);    // get a random color
  x_val = (random(400));
  y_val = (random(400));


drawCross();
}

