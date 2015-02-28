
int i = 0;
int j = 0;
int r = 0;
boolean pinWheel = false;
void setup()
{

  frameRate(1000);
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  background(0);
  decrease = 2;
}

void draw()
{
  noFill();
  j++;
  i = j%360;  
  if (j >= 2520)
  {
    pinWheel = true;
  }
  r++;
  r = r % 210;
  //println(r);
  strokeWeight(1);
  if (round(random(3))==1)
  {
    stroke(0, 0, 100);
  }
  else
  {
    stroke(random(210, 250), random(70, 100), random(70, 100));
  }
  pushMatrix();
  translate(width/2, height/2);
  //rotate(i);
  scale(4);
  arc(0, 0, r, r, radians(i), radians(i+30));
  popMatrix();
  if (pinWheel)
  {
    //adjust the integer sent to "travel" to adjust how "fast" you're going
    travel(20);

    j+=30;
  }

  /*if((j%36 == 0) && (j < 10080))
   {
   saveFrame("hyperspace-########.png");
   }*/
}

void travel(int speed)
{
  int myr = r;
  for(int k = 0; k < speed; k++)
  {
    if (round(random(3))==1)
    {
      stroke(0, 0, 100);
    }
    else
    {
      stroke(random(210, 250), random(70, 100), random(70, 100));
    }
    pushMatrix();
    translate(width/2, height/2);
    //rotate(i);
    scale(4);
    arc(0, 0, r, r, radians(i), radians(i+30));
    popMatrix();
    j++;
    i = j % 360;
    r++;
  }
}



