
size (500, 375);
int centerx=width/2;
int centery=height/2;
background (255);
noStroke ();
int nu=150;
int ax=centerx;
int bx=centerx-nu;
int cx=centerx+nu;
int ay=centery-nu;
int by=centery+nu;
int cy=by;
fill (nu);
triangle (ax,ay,bx,by,cx,cy);
for (int i=nu; i>0; i--)
{
  bx=centerx-i;
cx=centerx+i;
ay=centery-i;
by=centery+i;
cy=by;
fill (i);
triangle (ax,ay,bx,by,cx,cy);
}

int a1x=centerx;
int b1x=centerx-nu;
int c1x=centerx+nu;
int a1y=centery+nu;
int b1y=centery-nu;
int c1y=b1y;

for (int i=nu; i>0; i--)
{
  b1x=centerx-i;
c1x=centerx+i;
a1y=centery+i;
b1y=centery-i;
c1y=b1y;
fill (i);
triangle (a1x,a1y,b1x,b1y,c1x,c1y);
}
 





