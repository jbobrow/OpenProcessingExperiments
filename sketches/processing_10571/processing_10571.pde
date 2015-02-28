
void setup()
{
  size(500,300);
  frameRate(30);
}
int centerx,centery,ax,ay,bx,by,cx,cy;
int trichey=height/3;
boolean scalebig=false;

void draw()
{
  centerx=width/2;
  centery=height/2;
  ax=centerx;
  bx=centerx=trichey;
  cx=centerx+trichey;
  ay=centery+trichey;
  cy=by;
  background(123,0,155);
  stroke(7);
  triangle(ax,ay,bx,by,cx,cy);
  trichey=trichey+4;
  if (scalebig) {trichey=trichey+3;}
  else {trichey=trichey-1;}
  fill(trichey);
}

