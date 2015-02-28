
float radius = 100.0;
float diameter = radius * 2.0;

void setup()
{
  size(800, 400);
  noLoop();
}
// ISS: 6
// GEO: 562
// moon: 6034
void draw()
{
  // Go, go, gadget trigonometry!
  float rsat = max(radius, mouseX); // altitude from center of sphere
  float h = mouseX - radius; // height, i.e. altitude
  float a_horizon = asin(radius / (rsat));
  float a_desired = map(mouseY, 0, height, 0.01, HALF_PI);
  float a = min(a_horizon, a_desired);
  //float d = rsat * cos(a) - sqrt(radius*radius - rsat*rsat * sin(a) * sin(a)); // same as s

  // from http://www-personal.umich.edu/~btcesul/OSU_AAE4517/Week4/sat_angle_coverage.pdf
  float f = rsat/radius * sin(a);
  float beta = asin(clamp(f, -1.0, 1.0)) - a;
  //float theta = acos(rsat/radius * sin(a));
  float s = rsat * cos(a) - sqrt(radius*radius - rsat*rsat * sin(a) * sin(a));
  float w = radius * sin(beta);
  float a1 = sqrt(radius*radius - w*w);

  background(255);
  pushStyle();
  strokeWeight(1);

  // draw the sphere and center dot
  arc(0, height/2, diameter, diameter, TWO_PI-HALF_PI, TWO_PI);
  arc(0, height/2, diameter, diameter, 0, HALF_PI);
  fill(0);
  ellipse(0, height/2, 2, 2);

  // draw the lines to the sphere
  stroke(255, 0, 0);
  pushMatrix();
  translate(mouseX, height/2);
  rotate(a);
  line(0, 0, -s, 0);
  rotate(-2 * a);
  line(0, 0, -s, 0);
  popMatrix();

  // draw ugly dotted lines if the actual angle is greater than the angle to the horizon
  if (a_desired > a_horizon)
  {
    stroke(255, 150, 150);
    pushMatrix();
    translate(mouseX, height/2);
    rotate(a_desired);
    dotted_line(0, 0, -s * 2.0, 0);
    rotate(-2 * a_desired);
    dotted_line(0, 0, -s * 2.0, 0);
    popMatrix();
  }

  // line from center to edge of length 'radius'
  stroke(180);
  pushMatrix();
  translate(0, height/2);
  rotate(TWO_PI - beta);
  line(0, 0, radius, 0);
  popMatrix();

  // draw the swath
  pushMatrix();
  translate(a1, height/2);
  line(0, 0, 0, -w);
  line(0, 0, 0, w);
  popMatrix();

  // highlight coverage area on the sphere
  stroke(255, 0, 0);
  strokeWeight(3);
  noFill();
  arc(0, height/2, diameter, diameter, TWO_PI-beta, TWO_PI);
  arc(0, height/2, diameter, diameter, 0, beta);

  // satellite
  fill(0);
  stroke(0);
  ellipse(mouseX, height/2, 4, 4);

  text(
  "\u03B1 = " + nf(degrees(a), 0, 2) + "\u00B0\n" +
  "Alititude = " + nf(h, 0, 0) + "\n" +
  "Surface Coverage = " + nf((1 - cos(beta)) * 50.0, 0, 2) + "%"
  , 10, 15);

  popStyle();
}

void dotted_line(float x1, float y1, float x2, float y2)
{
  float d = dist(x1, y1, x2, y2);
  float inc = 1.0 / (d / 5.0);

  float p = 0.0;
  while (p < 1.0)
  {
    float xs = lerp(x1, x2, p);
    float xe = lerp(x1, x2, p + inc);
    float ys = lerp(y1, y2, p);
    float ye = lerp(y1, y2, p + inc);

    line(xs, ys, xe, ye);

    p += (inc * 2.0);
  }
}

void mouseMoved()
{
  redraw();
}

float clamp(float v, float mi, float ma)
{
  if(v > ma) return ma;
  if(v < mi) return mi;
  return v;
}

