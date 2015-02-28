
float farbe;
float angle;
boolean schalter = true;
void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  noFill();
  strokeWeight(0.1);
  
  
}


void draw()
{
  background(0);
  for(int x = 0; x < width +1; x+= 50)
  {
    for(int y = 0; y < height +1; y+= 50)
    {
      farbe = (farbe +2) % 255;
      fill(farbe);
       
      arc(x, y, 100, 100, 0, angle);
    }
  }
  if(schalter)
  {
    angle += TWO_PI/1000;
    if(angle > HALF_PI) schalter = false;
  }
  else
  {
    angle -= TWO_PI/1000;
    if(angle < TWO_PI/1000) schalter = true;
  }
    
    
    
}

