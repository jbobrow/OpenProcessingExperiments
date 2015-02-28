
//Jimmy C ; Block 6; CP1

int h = 0;
int bh = -400;




void setup()
{
  size(400, 260);
  noFill();
  background (255, 255, 255);
  frameRate(300);
}
void draw()
{
  redstripe();
  bluebox();
  stars();
}

void redstripe()
{
  fill(196,22,22);
  stroke(255,0,0);
  rect(0,0,h,20);
  rect(0,40,h,20);
  rect(0,80,h,20);
  rect(0,120,h,20);
  rect(0,160,h,20);
  rect(0,200,h,20);
  rect(0,240,h,20);
  h = h + 1;
}

void bluebox()
{
  fill(3,26,133);
  stroke(3,26,133);
  rect(bh,0,170,120);
  bh=bh+1;
  if (bh>0)
  bh=0;
}

void stars()
{
  if (bh>-1)
  fill(255,255,255);
  int s=15;
  int ss=28;
  if (bh>-1)
  while (s<169)
  {
  ellipse(s,10,12,12);
  ellipse(s,34,12,12);
  ellipse(s,56,12,12);
  ellipse(s,80,12,12);
  ellipse(s,104,12,12);
  s=s+28;
  }
  if (bh>-1)
  while (ss<151)
  {
  ellipse(ss,21,12,12);
  ellipse(ss,45,12,12);
  ellipse(ss,68,12,12);
  ellipse(ss,92,12,12);
  ss=ss+28;
  }
}
