
void setup()
{
  size(380, 800);
  rectMode(CENTER);
  noLoop();
  noFill();
}

void draw()
{
  background(255);
  
  for (int i=0; i<=12; i++)
    for (int r=0; r<=25; r++)
    { float s= 28;
      float posX = s/1.5+i*s + random(-r, r);
      float posY = s/1.5+r*s + random(-r, r);
      //float displacement = 
      pushMatrix();
      translate(posX,posY);
      rotate(radians(random(r)));

     
      rect(0, 0, s, s);
      popMatrix();
    }
}
