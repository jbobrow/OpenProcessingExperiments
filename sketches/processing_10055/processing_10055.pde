
boolean flip = false;

void setup() 
{
  size(500,500);
  background(255);
  noStroke();
  smooth();
  //ellipseMode(LEFT);
}


void draw()
{
  //translate( width/2, width/2 );
  for (int i = 0; i < 31; i++)
  {
    pushMatrix();
    
    ////FARBE
    fill( 255 );
    if(flip)
    fill(0);
    flip = !flip; 
    
    translate(0, -i*8);
    ellipse(width/2, width/2, map(i,0,30,width,0), map(i,0,30,height,0));
    popMatrix();
  }
  noLoop();
}


