
int [] anIntArray = {100,150,200,250,300};
int [] circleSpeed = {1,2,3,4,5};

void setup ()
{
  size (400,400);
  background (0);
  rect (20,0,360,380);
}

void draw ()
{
  fill (100,10,250);
  ellipse (anIntArray[0], anIntArray[0],20,20);
  
  fill (250,0,0);
  ellipse (anIntArray[1], anIntArray[1],20,20);
  
  fill (0,250,0);
  ellipse (anIntArray[2], anIntArray[2],20,20);
  
  fill (0,0,250);
  ellipse (anIntArray[3], anIntArray[3],20,20);
  
  fill(255,255,0);
  ellipse (anIntArray[4], anIntArray[4],20,20);
  
   if((mouseX<20 && mouseX>0 && mouseY>0 &&mouseY;<400)
  || (mouseY>380 && mouseY<400 && mouseX>0 && mouseX<400)
  || (mouseX>380 && mouseX<400 && mouseY>0 && mouseY<400))
  
  {
  anIntArray[0] = anIntArray[0] + circleSpeed[0];
  anIntArray[1] = anIntArray[1] + circleSpeed[1];
  anIntArray[2] = anIntArray[2] + circleSpeed[2];
  anIntArray[3] = anIntArray[3] + circleSpeed[3];
  anIntArray[4] = anIntArray[4] + circleSpeed[4];
  
  if (anIntArray[0] > 380 || anIntArray[0] < 0)
  
  circleSpeed[0] = circleSpeed[0]*-1;
  
  if (anIntArray[1] > 380 || anIntArray[1] < 0)
  
  circleSpeed[1] = circleSpeed[1]*-1;
  
  if (anIntArray[2] > 380 || anIntArray[2] < 0)
  
  circleSpeed[2] = circleSpeed[2]*-1;
  
  if (anIntArray[3] > 380 || anIntArray[3] < 0)
  
  circleSpeed[3] = circleSpeed[3]*-1;
  
  if (anIntArray[4] > 380 || anIntArray[4] < 0)
  
  circleSpeed[4] = circleSpeed[4]*-1;
 
  }
}
