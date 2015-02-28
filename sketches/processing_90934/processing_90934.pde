
int [] anIntArray = {30, 60, 90, 120, 150};
int [] speedArray = {1, 1, 1, 1, 1};
void setup()
{
  size(200, 200);
  background(255);
}
void draw()
{
  background(255);
  fill(255, 0, 0);
  rect(anIntArray[0], 30, 20, 20);
  rect(anIntArray[1], 60, 20, 20);
  rect(anIntArray[2], 90, 20, 20);
  rect(anIntArray[3], 120, 20, 20);
  rect(anIntArray[4], 150, 20, 20);
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
  speedArray[0] = speedArray[0]*-1;
  if (anIntArray[1] > 180 || anIntArray[1] < 0)
  speedArray[1] = speedArray[1]*-1;
  if (anIntArray[2] > 180 || anIntArray[2] < 0)
  speedArray[2] = speedArray[2]*-1;
  if (anIntArray[3] > 180 || anIntArray[3] < 0)
  speedArray[3] = speedArray[3]*-1;
  if (anIntArray[4] > 180 || anIntArray[4] < 0)
  speedArray[4] = speedArray[4]*-1;

  }
}
