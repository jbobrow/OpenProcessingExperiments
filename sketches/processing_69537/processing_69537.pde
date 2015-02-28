
//Dominique A., Loop Shapes, CP1, Mod 16-17

size(300,300);
background(0);
noFill();
smooth();

stroke(255);
int y = 0;
while(y < 250)
{
  ellipse(150,150,y,250);
  y = y + 10;
}

stroke(255,130,13);
int b = 0;
while(b < 250)
{
  ellipse(150,240,b,70);
  b = b + 10;
}

stroke(255,18,10);
int x = 5;
while(x < 250)
{
  ellipse(150,150,50,x);
  x = x + 10;
}
stroke(255,243,10);
int k=20;
while(k<50)
{
  ellipse(150,170,k,60);
  k= k+2;
}
stroke(3,255,122);
int w=0;
while(w<100)
{
  ellipse(150,150,w,100);
  w=w+10; 
}

stroke(50,0,255);
int h=5;
while(h<150)
{
  ellipse(150,150,100,h);
  h=h+10;

}
int p = 10;
int offset = 0;
while(offset < 100)
{
  ellipse(100 - offset,50,70,p);
  ellipse(200 + offset,50,70,p);
  p = p + 3;
  offset = offset + 2;
}
stroke(0);
int s = 0;
while(s < 100)
{
  ellipse(150,150,s,100);
  s = s + 10;
}
