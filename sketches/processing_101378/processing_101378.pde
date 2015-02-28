
// Implementation of the apollonius circles. 
// Written by Jakob Thomsen.
// (see http://en.wikipedia.org/wiki/Circles_of_Apollonius)

class circle
{
  float x;
  float y;
  float r;

  circle()
  {
  }

  circle(float R, float X, float Y)
  {
    r = R;
    x = X;
    y = Y;
  }

  void display()
  {
    ellipse(x, y, 2.0 * r, 2.0 * r);
  }
}

float distance(circle a, circle b)
{
  float dx = b.x - a.x;
  float dy = b.y - a.y;

  return sqrt(dx * dx + dy * dy);
}

circle [] cs;

void balance_cs(
circle c0, circle c1, circle c2)
{
  float d01 = distance(c0, c1);
  float d12 = distance(c1, c2);
  float d20 = distance(c2, c0);

  c0.r = 0.5 * ( d01 - d12 + d20);
  c1.r = 0.5 * ( d01 + d12 - d20);
  c2.r = 0.5 * (-d01 + d12 + d20);
}

void init_cs()
{
  cs[0] = new circle();
  cs[0].x = width * 1 / 4;
  cs[0].y = height * 2 / 3;

  cs[1] = new circle();
  cs[1].x = width * 3 / 4;
  cs[1].y = height * 2 / 3;

  cs[2] = new circle();
  cs[2].x = width * 1 / 2;
  cs[2].y = height * 1 / 4;

  balance_cs(cs[0], cs[1], cs[2]);
}

void init_cs_fit(circle c)
{

  cs[0] = new circle();
  cs[0].x = c.x + c.r / 2.0 * cos(0.0 * 1.0 / 3.0 * 2.0 * PI);
  cs[0].y = c.y + c.r / 2.0 * sin(0.0 * 1.0 / 3.0 * 2.0 * PI);

  cs[1] = new circle();
  cs[1].x = c.x + c.r / 2.0 * cos(1.0 * 1.0 / 3.0 * 2.0 * PI);
  cs[1].y = c.y + c.r / 2.0 * sin(1.0 * 1.0 / 3.0 * 2.0 * PI);

  cs[2] = new circle();
  cs[2].x = c.x + c.r / 2.0 * cos(2.0 * 1.0 / 3.0 * 2.0 * PI);
  cs[2].y = c.y + c.r / 2.0 * sin(2.0 * 1.0 / 3.0 * 2.0 * PI);

  balance_cs(cs[0], cs[1], cs[2]);
}

void updateApoloniusCircle(
circle result, circle c0, circle c1, circle c2, boolean flag)
{
  float a01 = 2 * (c0.x - c1.x);
  float b01 = 2 * (c0.y - c1.y);
  float c01 = 2 * (c0.r - c1.r);
  float d01 = (c0.x * c0.x + c0.y * c0.y - c0.r * c0.r)
    - (c1.x * c1.x + c1.y * c1.y - c1.r * c1.r);

  float a02 = 2 * (c0.x - c2.x);
  float b02 = 2 * (c0.y - c2.y);
  float c02 = 2 * (c0.r - c2.r);
  float d02 = (c0.x * c0.x + c0.y * c0.y - c0.r * c0.r)
    - (c2.x * c2.x + c2.y * c2.y - c2.r * c2.r);

  float c_a = c02 * a01 - c01 * a02;
  float d_a = d02 * a01 - d01 * a02;
  float b_a = b02 * a01 - b01 * a02; 

  float c_b = c02 * b01 - c01 * b02;
  float d_b = d02 * b01 - d01 * b02;
  float a_b = a02 * b01 - a01 * b02;

  float alpha = c_b * c_b + c_a * c_a - a_b * a_b;
  float beta = 2 * (c_b * d_b - c_b * a_b * c0.x + c_a * d_a + c_a * a_b * c0.y + a_b * a_b * c0.r);
  float gamma = -2 * d_b * a_b * c0.x + a_b * a_b * c0.x * c0.x + d_b * d_b + 2 * d_a * a_b * c0.y + a_b * a_b * c0.y * c0.y + d_a * d_a  - a_b * a_b * c0.r * c0.r;

  float square = beta * beta - 4 * alpha * gamma;
  float r_one = (-beta + sqrt(square)) / (2 * alpha);
  float r_two = (-beta - sqrt(square)) / (2 * alpha);

  result.r = flag ? r_two : r_one;

  result.x = (result.r * c_b + d_b) / a_b;
  result.y = (result.r * c_a + d_a) / b_a;
}

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);

  cs = new circle[3];

  // init_cs();
  init_cs_fit(new circle(width/2, height/2, min(width, height)/2));
}

void draw()
{
  background(1);

  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      cs[0].x = mouseX;
      cs[0].y = mouseY;
      balance_cs(cs[0], cs[1], cs[2]);
    }

    if (mouseButton == CENTER)
    {
      cs[1].x = mouseX;
      cs[1].y = mouseY;
      balance_cs(cs[0], cs[1], cs[2]);
    }

    if (mouseButton == RIGHT)
    {
      cs[2].x = mouseX;
      cs[2].y = mouseY;
      balance_cs(cs[0], cs[1], cs[2]);
    }
  }

  circle s0 = new circle();
  updateApoloniusCircle(s0, cs[0], cs[1], cs[2], false);
  circle s1 = new circle();
  updateApoloniusCircle(s1, cs[0], cs[1], cs[2], true);

  noFill();
  stroke(0);
  s0.display();
  s1.display();

  fill(0);
  stroke(0);
  for (int nr = 0; nr < 3; nr++)
  {
    cs[nr].display();
  }
}
