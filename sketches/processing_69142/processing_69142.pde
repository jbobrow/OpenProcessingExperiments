
//Alina Vakutin, Loops, CP 1 mods 16-17
background(0);
size(500,500);
strokeWeight(3);
noFill();
int y = 0;
while (y < 381)
{
 stroke(y,0,250-y);
 rect(y,y,175,175);
 y= y + 10;
}
int a = 10;
while( a < 300)
{
  stroke(0,250-a,a);
  ellipse(150,400,a,150);
  a = a + 20;
}
int b = 10;
while(b < 300)
{
  stroke(0,b,250-b);
  ellipse(350,100,b,150);
  b = b + 20;
}
