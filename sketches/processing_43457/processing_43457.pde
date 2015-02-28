
float m;
float easedR=0;
float easing = 0.03;

void setup()
{
  size(800, 800);
  smooth();
  noFill();
  rectMode(CENTER);
}

void draw()
{
  background(252, 240, 222);
  noFill();
  target(mouseX);
}


void target(float mx)
{

  m = map(mx, 0, width/2, 0, 50);
  easedR += (m - easedR) * easing;

  translate(width/2, height/2);
  for (int i=0; i<=360; i+=10)
  {
    pushMatrix();
    float x = easedR * cos(radians(i));
    float y = easedR * sin(radians(i));

    rotate( radians(easedR*i/50.0));
    scale (10);
    ellipse (25, 25, 50, 50);
    line ( 0, 0, 50, 50);
    line ( 50, 0, 0, 50);
    popMatrix();
  }
}


