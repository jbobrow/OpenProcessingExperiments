
int x = 100;
int y = 200;
int space = 30;
int x2 = 10;
int y2 = 25;
int endpoint = 290;
void setup ()
{
  size (300,300);
  background(0);
  
}

void draw()
{
  fill(255);
  strokeWeight (5);
  ellipseMode(CORNER);
  ellipse (40, 65, 51, 130);
  ellipse (92, 65, 51, 130);
  fill (mouseX, mouseY, 3);
  ellipseMode (CENTER);
  ellipse (75, 140, 10, 30);
  ellipse (110, 140, 10, 30);
  stroke (4);
  line (90, 30, 20, 80);
  line (160, 80, 100, 30);
  noStroke ();
  ellipseMode(CENTER);
  fill(28, 147, 234);
  while (y <= endpoint)
  {
    ellipse (x, y, x2, y2);
    y = y + space;
  }
 
}



