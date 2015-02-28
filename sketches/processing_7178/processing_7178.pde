
float lauf = -5;

void setup()
{
  size(700, 500);
  frameRate(60);
  background(255);
  colorMode(HSB);
}

void draw()
{
  noFill();
  stroke(-lauf * 10 + 230, 100, 100, 10);
  lauf += 0.01;
  translate(width / 2, height / 2);
  rotate(-lauf);
  rrect2(lauf*2, 0, 200, 200, lauf, "MITTELPUNKT");
  if(lauf >= 23) noLoop();
}

void rrect2(float x, float y, float b, float h, float t, String m)
{
  if(m == "MITTELPUNKT")
  {
    x = x - b / 2;
    y = y - h / 2;
  }
  curveTightness(t); // konkav > -2.2 > konvex // -0.66 = kreis // konkav > 1
  beginShape();
  curveVertex(x + b, y);
  curveVertex(x, y);
  curveVertex(x, y + h);
  curveVertex(x + b, y + h);
  curveVertex(x + b, y);
  curveVertex(x, y);
  curveVertex(x, y + h);
  endShape();
}

