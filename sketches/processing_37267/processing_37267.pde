
float x;
float y;
float xx;
float yy;

void setup ()
{
  size(800, 800);
  background(random(50, 255));
  smooth();

  x = 20;
  y = 20;
}

void draw()
{
  stroke(1);
  line(400, 0, 400, 800);
  line(0, 400, 800, 400);

  xx  = mouseX;
  yy  = mouseY;

  noStroke();
  ellipse(xx, yy, x, y);

  if (xx < 300)x = x+0.5;
  else x = x-0.5;

  if (yy < 300)y = y+0.5;
  else y = y-0.5;

  print(mouseX);
  print(",");
  println(mouseY);
}

void mouseClicked() 
{
  fill(random (255), random (255), random (255));
}


