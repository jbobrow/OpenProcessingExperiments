
void setup()
{
size(300, 520);
noLoop();
//background(200);
}

void draw()
{
  smooth();
for ( int i=0; i<13;i++)
{
  for (int j=0; j<23; j++)
  {
      pushMatrix();

      //translations
      translate(20+20*i, 20+20*j);
      
      //randomness
      translate(random(-1, 1), random(-1, 1));
      //rotations
      float randAngle = (random((-PI)*j,(PI)*j));
      rotate(radians(randAngle));

      //Now, draw the squares!!
      noFill();
      rect(0, 0, 20, 20);
      popMatrix();
    }
  }
}


