
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
  background(255);
  noFill();
  target(mouseY);
}
 
 
void target(float mx)
{
 
  m = map(mx, 0, width/1, 0, 50);
  easedR += (m - easedR) * easing;
 
  translate(width/1, height/2);
  for (int i=0; i<=360; i+=10)
  {
    pushMatrix();
    float x = easedR * cos(radians(i));
    float y = easedR * sin(radians(i));
 
    rotate( radians(easedR*i/50.0));
    scale (10);
    rect (25, 25, 20, 20);
    line ( 0, 0, 50, 50);
    line ( 50, 0, 0, 50);
    popMatrix();
  }
}

