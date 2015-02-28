
float t, r, r2, dt;
PVector cartesian, cartesiana, cartesian2, cartesian2a;

void setup()
{
  size(800, 800);
  smooth();
  background(255);
  colorMode(HSB);
  t = 1;
  r2 = 100*(1/(1.0*cos(t/3.1)));
  dt = .01;

  cartesian2a = polarConvert(t, r2);
  cartesian2 = polarConvert(t, r2);
  cartesian2.x += width/2;
  cartesian2.y += height/2;
  cartesian2a.x += width/2;
  cartesian2a.y += height/2;
}

void draw()
{
  //outside
  strokeWeight(1);
  r2 = 100*(1/(1.0*cos(t/3.1)));
  cartesian2a = cartesian2;
  cartesian2 = polarConvert(t, r2);
  cartesian2.x += width/2;
  cartesian2.y += height/2;
  constrain(cartesian2.x, 0, width);
  constrain(cartesian2.y, 0, height);
  stroke(0, 255, 100,40);
  line(cartesian2.x, cartesian2.y, cartesian2a.x, cartesian2a.y); 

  //inside
  strokeWeight(2);
  r = 100*(cos((1/4.3)*t));
  cartesian = polarConvert(t, r);
  cartesiana = polarConvert(t-.01, r);
  cartesian.x += width/2;
  cartesian.y += height/2;
  cartesiana.x += width/2;
  cartesiana.y += height/2;
  constrain(cartesian.x, 0, width);
  constrain(cartesian.y, 0, height);
  stroke(127, 255, 127, 5);
  line(cartesian.x, cartesian.y, cartesiana.x, cartesiana.x);

  t += dt;
}


PVector polarConvert(float theta, float radius)
{
  float x, y;
  y = radius*(sin(theta));
  x = radius*(cos(theta));

  PVector result = new PVector(x, y);

  return result;
}

void keyPressed()
{
  if (key == 32)
  {
    background(255);
  }
  if (key > 48 && key < 58)
  {
    dt = .001 * (pow(10, (key - 49)));
  }
}


