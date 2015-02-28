
int deep=1;
void recurse(int depth, int tot, int x, int y)
{
  if (depth > 0)
  {
  fill(random(0,255),depth*64%256,256);
  ellipse(x,y,250/pow(3,depth),300/pow(3,depth));
  recurse(depth-1,tot,(int) (x+500/pow(2,tot-depth)),y);
  recurse(depth-1,tot,(int) (x-500/pow(2,tot-depth)),y);
  recurse(depth-1,tot,x,(int) (y+600/pow(2,tot-depth)));  
  recurse(depth-1,tot,x,(int) (y-600/pow(2,tot-depth)));
  }
  
}
void setup()
{
  size(500,600);
}
void draw()
{
  rectMode(CORNERS);
  fill(0,0,0);
  rect(0,0,500,600);

  translate(250,300);
    rotate(frameRate);
  recurse(deep,deep, 250, 300);
}
void keyPressed()
{
if (key=='w')
deep++;
if (key=='s')
deep--;
}

