
//Polly Lesaguis, CP1, mods 4/5

//back
background(0,0,0);
size(400,256);


float white = 0;
int x = 0;
while (x < 400)
{
  stroke(white);
  line(x,0,x,300);
  white = white + 255.0/400;
 x = x + 1;
}

//shape1
noFill();
smooth();
int x2 = 10;
while ( x2 < 1000)
{
  ellipse(x2,50,50,x2);
  x2 = x2 + 10;
}

//shape2
noFill();
stroke(0,0,0);
int h = 10;
int offset = 0;
while(offset < 1000)
{ 
  ellipse (10-offset,50,10,h);
  ellipse(10 + offset,50,10,h);
  h = h + 3;
  offset = offset + 20;
}
