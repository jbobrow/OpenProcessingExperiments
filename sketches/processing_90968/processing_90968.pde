
float r= random(200);
int [] anIntArray = {20,37,59,70,87};
int [] speedArray = {1, 2, 3, 4, 5};


void setup()
{
  size (200,200);
  background (0);
  fill(255);
  rect (20,0,160,180);
}


void draw()
{
  fill(0, 203, 160);
  ellipse(anIntArray[0], 30, 20, 20);
  fill(255,38,0);
  ellipse(anIntArray[1], 60, 20, 20);
  fill(200,55,190);
  ellipse(anIntArray[2], 90, 20, 20);
  fill(0,0,130);
  ellipse(anIntArray[3], 120, 20, 20);
  fill(0,255,40);
  ellipse(anIntArray[4], 150, 20, 20);
  if((mouseX<20 && mouseX>0 && mouseY>0 &&mouseY;<200)
  || (mouseY>180 && mouseY<200 && mouseX>0 && mouseX<200)
  || (mouseX>180 && mouseX<200 && mouseY>0 && mouseY<200))
  {
  anIntArray[0] = anIntArray[0] + speedArray[0];
  anIntArray[1] = anIntArray[1] + speedArray[1];
  anIntArray[2] = anIntArray[2] + speedArray[2];
  anIntArray[3] = anIntArray[3] + speedArray[3];
  anIntArray[4] = anIntArray[4] + speedArray[4];
  
  
  if (anIntArray[0] > 180 || anIntArray[0] < 0)
  speedArray[0] = speedArray[0]*-20;
  if (anIntArray[1] > 180 || anIntArray[1] < 0)
  speedArray[1] = speedArray[1]*-15;
  if (anIntArray[2] > 180 || anIntArray[2] < 0)
  speedArray[2] = speedArray[2]*-10;
  if (anIntArray[3] > 180 || anIntArray[3] < 0)
  speedArray[3] = speedArray[3]*-5;
  if (anIntArray[4] > 180 || anIntArray[4] < 0)
  speedArray[4] = speedArray[4]*-1;
 
  }
}
