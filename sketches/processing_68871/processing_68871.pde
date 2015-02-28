
// Gregory Taxerman, Repeating Shapes, CP1 16/17
//http://gtprograms.hostei.com/RepeatingShapes.html

size (500,500);
background(0);

int x = 0;
int redamount = 0;
int blueamount = 255;
while(x < 500)
{
  fill(redamount,0,blueamount);
  triangle(x,250,500,0,500,500);
  x = x + 10;
  redamount = redamount + 10;
  blueamount = blueamount - 5;
}

int z = 10;
int w = 20;
while(z<250)
{
  fill(redamount,0,blueamount);
  ellipse(100,250-z,w,20);
  ellipse(100,250+z,w,20);
  z = z + 10;
  w = w + 5;
  redamount = redamount - 20;
  blueamount = blueamount + 25;
}
