

int z=0;

void setup()
  {
    size(500,500);
    smooth();
    frameRate(6);
  }

void draw()
  {
    background(200, 60, 100);
    fill(255, 255, 0);
    if(z==0)
    {
      z=1;
      arc(250, 220, 100, 100, QUARTER_PI, TWO_PI-QUARTER_PI);
    }
  else
      {
        z=0;
        arc(250, 220, 100, 100, 0, TWO_PI);
      }
        
  fill(0);
  ellipse(260,195,10,5);
}





