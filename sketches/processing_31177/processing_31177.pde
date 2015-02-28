

size (500,500);
int centerx=width/2;
int centery=height/2;
//center of the window
background(150);
noStroke();
int Triangle_scale=150;
int ax=centerx;
int bx=centerx-Triangle_scale;
int cx=centerx+Triangle_scale;
int ay=centery-Triangle_scale;
int by=centery+Triangle_scale;
int cy=by;
fill(Triangle_scale);
triangle (ax,ay,bx,by,cx,cy);

for(int i=Triangle_scale; i>0; i=i-5)
{
   bx=centerx-i;
   cx=centerx+i;
   ay=centery-i;
   by=centery+i;
   cy=by;
fill(255-i);
triangle (ax,ay,bx,by,cx,cy);
}






