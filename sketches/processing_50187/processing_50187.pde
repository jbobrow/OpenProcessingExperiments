
//sketch
//copyright ben corwin 2012
float a, b, c;

void setup()
{
  size( 400, 400);
  background(0,0,0);
  noStroke();
  textSize(10);
  smooth();
  a = 0;
  b = 0;
  c = 0;
}

void draw( )
{
  
  fill(0,0,0,10);
  rect(0, 0, width, height);
  fill(.1 * a, 0, b);
  ellipse(0, 0, .5 * a,b);
  fill(a, 0 , .1 * b);
  ellipse(width, height, .5 * a,b);
  
  a = a + 1;
  b = b + 1;
 

 
}
