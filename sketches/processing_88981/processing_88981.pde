
int x = 0, speedX = 1;
void setup()
{size(200,200);
}
void draw()
{ background(255);
  drawEllipse();
}
 void drawEllipse()
 {
  ellipse(x, height/2 - 20, 10, 10);
  ellipse((width - x), height/2 + 20, 10, 10);
  x = x + speedX;
  if(x > width || x < 0)
  speedX = speedX * -1;
}
