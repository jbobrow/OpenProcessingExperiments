
size (320,320);
background (50,100,150);
int x=40;
int y=40;

while (x<=600){
  line (0,x,320,x); //hor
  line (x,0,x,320); //ver
  fill (255,255,255,100); //elip
  ellipse (y-35,y*y*500/430/430,10,10);
  x=x+40;
  y=y+25;
 }
