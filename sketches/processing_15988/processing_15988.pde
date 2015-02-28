
//M. Kontopoulos  (11.2010)
//TEARDROP CURVE
//Based on the parametric equation found at
//http://mathworld.wolfram.com/TeardropCurve.html
float r = 90.0;
float a = 0.0;

void setup()
{
  size(400,400);
  background(200);
  smooth();
}

void draw()
{
  background(200);

  a = map(mouseX,0,width,0,9);
  beginShape();
  for(int i=0; i<360; i++)
  {
    float x = width/2 + cos( radians(i) ) *r;
    //The exponent a controls the shape of the curve
    float y = height/2+ sin( radians(i) ) * pow(sin(radians(i)/2), a) *r;

    //ellipse(x,y, 10,10);
    //point(x,y);
    vertex(x,y);
  }
  endShape();
}


