
//Brandan H.

size(750,750);
background(255);
noFill();
int x=10;
while(x<751)
{
  translate(375,-175);
  rotate(PI/4);
  ellipse(375,375,750-x,x);
  rotate(-PI/4);
  translate(-375,175);
  ellipse(375,375,750-x,x);
  x=x+10;
}
