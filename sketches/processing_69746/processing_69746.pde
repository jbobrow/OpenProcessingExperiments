
//Jimmy C; Block 6; Programming 1

//loops
size (1000, 1000);
background (0);
noFill();
translate(500,500);

//blue loop
int h = 150;
int v = 150;
int w = 20;
while (h < 500)
while (v < 500)
{
  stroke(255,0,0);
  ellipse(h,v,w,w);
  h=h+10;
  v=v+10;
  w=w+50;
  
  rotate(PI/2);
}

//blue triangle
int p = 255;
stroke(0,0,255);
fill(0,0,255);
int 
while (one<500)
{
  triangle (one,one,210,190,190,210);
   + 30;
  
  rotate(PI/2);
}

//main loop
noFill();
int x = 150;
int big = 30;
int r = 0;
while (r<255)
while (x < 470)
{
  stroke(255,r,r);
  r=r+5;
  ellipse(x,x,big,big);
  x = x+5;
  big = big + 5;
  
  rotate(PI/2);
}

//center fill
int b = 20;
int s = 380;
while (b<256)
while (s>20)
{
  fill(0,0,b);
  b=b+15;
  ellipse (0,0,s,s);
  s=s-10;
}

//center red dot
fill (150,0,0,200);
ellipse (0,0,20,20);
