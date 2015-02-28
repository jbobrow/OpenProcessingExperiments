
boolean flip = false;

void setup() 
{
  size(700,500);
  background(255);
  noStroke();
  smooth();
}


void draw()
{
  for ( int i = 0; i <=7; i++)
  {
    //translate( (width/7)*i, 0);
    streifen( (90+10)*i, 0 );
  }
}

void streifen ( float x, float y)
{
  pushMatrix();
  translate(x,0);
  for ( int i = 0; i <= height; i++)
  {
    translate(0,i+10);
    fill(0);
    rect(0,0,90,random(0,15));
  }
  
  noLoop();
  popMatrix();
}

