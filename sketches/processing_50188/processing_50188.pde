
//sketch
//copyright ben corwin 2012
float a, b;

void setup()
{
  size( 400, 400);
  background(0,0,0);
  noStroke();
  textSize(10);
  smooth();
  a = 0;
  b = 0;
  
}

void draw( )
{
  
  fill(0,0,0,10);
  rect(0, 0, width, height);
  fill(mouseY,0,mouseX);
  ellipse(mouseX, mouseY, a,b);
  a = a + 1;
  b = b + 1;
 

 
}
