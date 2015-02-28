
//Eugene Liang, Loops, CP1, mods 16-17
//http://opagungnamstyle.webs.com/Computer Programing/Loops.html

int change = 15;

void setup()
{
  size(500,500);
  background(0);
  smooth();
  noFill();
  frameRate(8);
}

void draw()
{
  width();
  height();
}  


//width
int w = 0;

void width()
{
  stroke(255,255,255);
  ellipse(250,250,w,175);
  w = w + change;
  if(w > 500)
  {
    background(0,0,0);
  change = -15;
  }
}

int h = 0;
//height
void height()
{
  stroke(255,255,255);
  ellipse(250,250,175,h);
  h = h + change;
  if(h > 500)
  {
    change = -15;
  }
}
