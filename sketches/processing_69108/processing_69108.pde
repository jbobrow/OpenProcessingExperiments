
//William Tsang,Repeating Shapes, CP 1 Mods 14-15, 
size(600, 600);
strokeWeight(3);
int grad = 0;
while(grad < 301)
{
  stroke(grad,247,3);
  line(grad,0,grad,600);
  grad = grad + 1;
}
int opp = 600;
while(opp > 255)
{
  stroke(255,247,opp - 355);
  line(opp,0,opp,600);
  opp = opp - 1;
}
int y = 1000;
while (y > 10)
{
  int x = 10;
  while (x < 610)
  {
    noFill();
    stroke(119, 240, 194);
    ellipse(x, y, 50, 50);
    x = x + 30;
    y = y - 7;
  }
}

int z = 10;
while (z < 610)
{
  stroke(255, 88, 165);
  line(300, 300, z, 0);
  line(300, 300, z, 600);
  z = z + 30;
}
int len = 10;
while (len < 400)
{
  stroke(252, 18, 26);
  ellipse(300, 300,len,len);
  len = len + 30;
  int hi = 20;
  while ( hi < 400)
  {
    stroke(69,78,234);
    ellipse(300, 300,hi,hi);
   hi = hi + 20; 
    
  }
}
