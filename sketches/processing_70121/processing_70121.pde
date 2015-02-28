
//Brandan Hui Block 7 comp. prog. 1
int x=10;
void setup()
{
size(750,750);
stroke(100,200,255);
background(255);
frameRate(20);
noFill();
}
void draw()
{
  translate(375,-175);
  rotate(PI/4);
  ellipse(375,375,750-x,x);
  rotate(-PI/4);
  translate(-375,175);
  ellipse(375,375,750-x,x);
  x=x+10;
  if(x>750)
  {
    x=-2*x;
  }
}
