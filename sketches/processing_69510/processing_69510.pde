
//Tina L., CP1 14/15, Loops: Repeating Shapes
size(500,500);
background(0);
noFill();
stroke(0,255,0);
int w = 5;
while(w < 401)
{
  ellipse(250,250,400,w);
  ellipse(250,250,w,400);
  w = w + 10;
}
translate(250,250);
rotate(PI/3.0);
int l = 5;
while(l < 401)
{
  ellipse(0,0,400,l);
  ellipse(0,0,l,400);
  l = l + 10;
}
