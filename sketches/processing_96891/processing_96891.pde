
float centerX1, centerY1, centerX2, centerY2, speed;
float rise, run;
float fac1, fac2;
int value, clickCount;
boolean launched; 


void setup()
{
  size(800,500);
  centerX1 = -50;
  centerY1 = -50;
  centerX2 = -100;
  centerY2 = -100;
  rise = 0;
  run = 0;
  
  fac1 = 2; /* these are the factors to multiply the rise/run for either ball */
  fac2 = 0;
  
  value=0;
  speed = 1;
  clickCount= 0;
  launched = false;
}


void draw()
{
  background(0,75,0);

  cue();
  target();

  if (clickCount == 3)
  {
    move();
  }

}


void move()
{
  rise = centerY2 - centerY1;
  run = centerX2 - centerX1;
  float distance = dist(centerX2, centerY2, centerX1, centerY1);
  rise = rise / distance;
  run = run / distance;
  centerX1 += run*fac1;
  centerY1 += rise*fac1;
  
  centerX2 += run*fac2;
  centerY2 += rise*fac2;
 
  if (dist(centerX1, centerY1, centerX2, centerY2) < 50) {
     fac1 = 0;
     fac2 = 2;
  }
}

void cue()
{
  fill(255,255,255);
  ellipse(centerX1,centerY1,50,50);
}


void target()
{
  fill(value);
  ellipse(centerX2,centerY2,50,50);
}


void mouseClicked()
{
  if (clickCount == 0)
  {
    centerX1 = mouseX;
    centerY1 = mouseY;
    clickCount ++;
  }

  else if (clickCount == 1)
  {
    centerX2 = mouseX;
    centerY2 = mouseY;
    clickCount ++;
  }

  else if (clickCount == 2)
  {
    clickCount ++;
  }
}

void keyPressed()
{
  if (key == 'c')
  {
  centerX1 = -50;
  centerY1 = -50;
  centerX2 = -50;
  centerY2 = -50;
  clickCount= 0;
  }
}


