
//Victor Murillo, Computer Progarmming1, mods 16-17
int w = 0;
background(0,0,255);
size(500, 500);
noFill();
stroke(0,0,0);
smooth();
while (w < 556)
{
  ellipse(w,250,w,w);
  ellipse(400,250,w,20);
  rect(5,5,10,w);
  w = w + 10;
}


