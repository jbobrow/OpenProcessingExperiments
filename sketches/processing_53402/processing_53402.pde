
float x, y, z, d;
float angle = 0.0;

PShape circle1;
PShape circle2;
PShape tri;
PShape logotype;

void setup()
{
  frameRate(15);
  size(600, 600);
  shapeMode(CENTER);
  circle1 = loadShape("Circle1.svg");
  circle2 = loadShape("Circle2.svg");
  tri = loadShape("Triangle.svg");
  logotype = loadShape("TypeLogo.svg");
  smooth();
}

void draw()
{
  noStroke();
  background(255);
  pushMatrix();
  translate(width/2, height/2-40);
  shape(logotype, 0, 100);

  circle1.disableStyle();
  fill(random(0, 100), random(0, 100), random(0, 100));
  shape(circle1, -115+x, 0);

  circle2.disableStyle();
  fill(random(0, 150), random(0, 150), random(0, 100));
  shape(circle2, 0+y, 0);

  tri.disableStyle();
  fill(random(200, 255), random(100, 190), 16);
  shape(tri, 110+z, 0);

  popMatrix();
}


void keyPressed() {
  if (d == 0)
  {
    d = 255;
    loop();
  }

  else
  {

    d = 0;
    noLoop();
  }
}


