
//Brian C, Ticklish Penguin, CP 1 Mods 16/17

int x = 100;
int y = 300;
int col = 1;
int xy = 1;
void setup()
{
  size(400,400);
  background(0);
}
void mouseDragged()
{
  fill(0,0,0,10);
  rect(0,0,400,400);
  fill(240,139,7,x);
  ellipse(mouseX,mouseY,30,30);
}
void draw()
{
  fill(237-col,34+col,34+col,4+x);
  ellipse(x,x+xy,40,40);
  fill(42+col,45-col,216,4+x);
  ellipse(y,x,40,40);
  fill(37+col,149,30-col,4+x);
  ellipse(x,y,40,40);
  fill(227+col,210-col,57,4+x);
  ellipse(y,y-xy,40,40);
  x = x + int (random(-4,4));
  y = y + int (random(-4,4));
  col = col + int (random(-15,15));
  xy = xy + int (random(-5,5));
}
