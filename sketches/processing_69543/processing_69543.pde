
//Jinhe Weber, Computer Programming 1, Block 7

size(500,500);


int redAmount = 0;
int blueAmount = 255;
int y = 0;
while(y < 500)
{
  stroke(redAmount,0,blueAmount);
  line(y,0,y,500);
  y = y + 1;
  redAmount = redAmount + 1;
  blueAmount = blueAmount - 1;
}

int Red = 255;
int Blue = 0;
int z = 0;
while(z<500)
{
  stroke(Red,0,Blue);
  line(z,255,z,0);
  z = z + 1;
  Red = Red - 1;
  Blue = Blue + 1;
}

noFill();
strokeWeight(10);
stroke(0);
smooth();
int x = 0;
while ( x < 501)
{
  ellipse(x,125,250,250);
  x = x + 25;
  ellipse(x,375,250,250);
  x = x + 25;
}
