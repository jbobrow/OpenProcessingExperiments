
int opacity = 180;

void setup()
{
  size(400, 400);
  background(255);
  noStroke();
  smooth();
  frameRate(5);
}

void draw()
{
  int col = int(random(0, 255));
  int x = int(random(0, width));
  int y = int(random(0, height));
  int radius1 = int(random(0, 250));
  int radius2 = int(random(radius1*0.9, radius1*1.1));
  
  fill(col, opacity);
  ellipse(x, y, radius1, radius2);
}

