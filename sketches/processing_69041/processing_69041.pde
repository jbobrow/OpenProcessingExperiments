
//Em F, CP1 mods 4-5, Loops

size(250,250);
background(#000000);
noFill();
smooth();
int y = 100;
int x = 150;
while(x > 10)
{
  stroke(#8D38C9);
  ellipse(x-1,x-1,y,y);
  stroke(#646060);
  ellipse(x - 5,x - 5,y,y);
  stroke(#726E6D);
  ellipse(x,x,y - 5,y - 5);
  stroke(#6E6A6B);
  ellipse(x + 3, x + 3,y,y);
  stroke(#8D38C9);
  ellipse(x,x,y - 3,y - 3);
  stroke(#00FFFF);
  ellipse(x,x,y+2,y+2);
  y = y + 2;
  x = x - 2;
}
