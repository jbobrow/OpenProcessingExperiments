
size(500, 500);
background(1, 226, 64);
//line(0, 0, width, height);

for(int x=30; x<500; x=x+15)
{
 for(int y=20; y<500; y=y+15)
 {
   for(int c=55; c<500; c=c+15)
   {
    rect( x,  y, c, 55);
 }
 }
}

