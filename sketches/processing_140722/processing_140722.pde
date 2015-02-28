
color c1, c2, c3;

void setup()
{
  size(400, 400);
  c1= color(200, 0 , 0); //red
  c2 = color(0, 200, 0); // green
  c3 = color(0, 0, 200); //blue
  strokeWeight(3);
  ellipseMode(CORNER);
}

void draw()
{
  background(200);
  design(100, 100, 90, c1, c2);
  design(180, 200, 165, c1, c3);
  noLoop();
}

void design(float x, float y, float diamRect, color cR, color cE)
{
  fill(cR);
  rect(x, y, diamRect, diamRect);
  rect(x, y, diamRect, diamRect);
  fill(cE);
  ellipse(x, y, diamRect/2, diamRect/2);
  line(x, y+diamRect, x+diamRect, y);
}



