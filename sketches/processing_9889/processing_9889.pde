
size(450,450);
int centerx=width/2;
int centery=height/2;
background(0);
stroke(255);
int Triangle_scale=150;
int ax=centerx;
int bx=centerx-Triangle_scale;
int cx=centerx+Triangle_scale;
int ay=centery-Triangle_scale;
int by=centery+Triangle_scale;
int cy=by;
fill(100,0,155);
triangle(ax,ay,bx,by,cx,cy);
for(int i=Triangle_scale; i>0; i=i-4)
  {
    bx=centerx-i;
    cx=centerx+i;
    ay=centery-i;
    by=centery+i;
    cy=by;
    fill(100,0,155);
    triangle(ax,ay,bx,by,cx,cy);
  }


