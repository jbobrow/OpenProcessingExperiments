
int rad = 200;
PVector v1, v2;
//float v1,v2

void setup()
{
  size (600, 600);
  smooth();
  strokeWeight (1);
  background (0);
}

void draw ()
{

  float angle = random (TWO_PI); 
  float angle2 = random (TWO_PI);

 v1 = new PVector (width/2 + cos (angle) * rad , height/2 + sin (angle) * rad);
 v2 = new PVector (width/2 + cos (angle2) * rad , height/2 + sin (angle2) * rad);

//  float v1 = (width/2 + cos (angle) * rad, height/2 + sin (angle) * rad);
//  float v2 = (width/2 + cos (angle2) * rad, height/2 + sin (angle2) * rad);

  noFill();
  stroke (random(255), random(255), random(255), random(255));
  line (v1.x, v1.y, v2.x, v2.y);
}
