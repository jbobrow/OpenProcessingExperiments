

background(0,0,0);
size(400,256);


double white = 0;
int x = 0;
while (x < 400)
{
  stroke(white);
  line(x, 0, x, 300);
  white = white + 255.0/400;
  x = x + 1;
}

noFill();
int x2 = 10;
while ( x2 < 1000)
{
  ellipse(x2,50,50,x2);
  x2 = x2 + 8;
}

noFill();
stroke(0,0,0);
int space = 10;
int offset = 0;

while(offset < 1000)
{ 
  ellipse (10 - offset, 50, 10, space);
  ellipse(10 + offset, 50, 10, space);
  space = space + 3;
  offset = offset + 20;
}
