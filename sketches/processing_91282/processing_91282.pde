
size(200,200);
background(0);
rect(20,0,160,180);

int[] posX = {50,70,90,110,130};

fill(255,0,0);
rect(posX[0], height/2, 15 ,15);
rect(posX[2], height/2, 15 ,15);
rect(posX[4], height/2, 15 ,15);
fill(0,255,0);
rect(posX[1], height/2, 15 ,15);
rect(posX[3], height/2, 15 ,15);

if(mouseX<20&&mouseX;>180&&mouseY;>180)
{
  fill(0,0,255);
  rect(posX[0], height/2, 15 ,15);
  rect(posX[2], height/2, 15 ,15);
  rect(posX[4], height/2, 15 ,15);
  fill(45,67,89);
  rect(posX[1], height/2, 15 ,15);
  rect(posX[3], height/2, 15 ,15);
}
