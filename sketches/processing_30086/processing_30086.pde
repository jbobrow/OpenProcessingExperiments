
//MOUSE + IF + BOUNDARIES

void setup()
{
  size(500,500);
  smooth();
  noStroke();
}
void draw()
{
  background(100); 
  if( (mouseX >=100) && (mouseX <=200) 
    && (mouseY >=150) && (mouseY <=250))
  {
    fill(255); 
    cursor(HAND);        

    if(mousePressed==true)
    {
      if(mouseButton == LEFT)
        fill(255,0,0);
      else
        fill(0,255,0);
    }
  }
  else
  {
    fill(0); 
    cursor(ARROW);
  }
  rect(100,150, 100,100);
}


