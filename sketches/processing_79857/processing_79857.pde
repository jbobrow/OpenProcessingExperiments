
void setup()
{
  size(300,300);
  background(0);
  noFill();
  frameRate(10);
  stroke(#FF7112);
}
float x=10;
float y=10;
float left=290;

void draw()
{
  ellipse(y,y,x,x);
  ellipse(left,left,x,x);
  ellipse(y,left,x,x);
  ellipse(left,y,x,x);
  x=x+1;
  y=y+1;
  left=left-1;
  if(y==120){
  noLoop();
}
}


