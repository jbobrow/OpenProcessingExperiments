
//Raymond Fang's (Your Dai Lo's) Massive Scale!

float xposition=20;
float yposition=20;

void setup ()
{
  size (800, 800);
  background (0);
}

void draw() {
  background (0);
  for (float r=1; r<20; r++) {
  for (float i=1; i<20; i++) {
  ellipse(xposition+25*i, yposition+25*r, 15, 15);
  fill (random(255),random(255),random(255));
  stroke (random(255),random(255),random(255));
  line(random(r,width),random (r,height),xposition+250,yposition+250);

      if (xposition > 280)
      {
        xposition = (random(800));
      }

      if (yposition > 280)
      {
        yposition = (random(800));
      }
      if (xposition < 0)
      {
        xposition = (random(800));
      }

      if (yposition < 0)
      {
        yposition = (random(800));
      }
    }
  } 
  xposition++;
  yposition++;
}

