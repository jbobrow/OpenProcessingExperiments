
//Bozhong H. Animation CP1 Mods 14-15
int x=1;
int y=1;
int height=50;
float stop=5.4;
float start=.7;
float change=.01;
void setup()
{
  size(500, 500);
  noStroke();
  smooth();
  frameRate(240);
}
void draw()
{
  pacman();
}
void pacman()
{
  background(0);
  fill(255, 0, 0);
  ellipse(x+19, height, 10, 10);
  fill(240, 250, 0);
  arc(x, height, 50, 50, start, stop);
  fill(0);
  ellipse(x+6, height-15, 8, 8);
  //blue ghost
  fill(0, 0, 255);
  beginShape();
  curveVertex(x-110,height+25);
  curveVertex(x-110, height+25);
  curveVertex(x-100, height-40);
  curveVertex(x-60, height-40);
  curveVertex(x-50, height+25);
  curveVertex(x-50, height+25);
  endShape();
  fill(0);
  ellipse(x-90, height-30, 10, 10);
  ellipse(x-70, height-30, 10, 10);
  triangle(x-110, height+25, x-100, height+15, x-90, height+25);
  triangle(x-90, height+25, x-80, height+15, x-70, height+25);
  triangle(x-70, height+25, x-60, height+15, x-50, height+25);
  //red ghost
  fill(255, 0, 0);
  beginShape();
  curveVertex(x-180,height+25);
  curveVertex(x-180, height+25);
  curveVertex(x-170, height-40);
  curveVertex(x-130, height-40);
  curveVertex(x-120, height+25);
  curveVertex(x-120, height+25);
  endShape();
  fill(0);
  ellipse(x-160, height-30, 10, 10);
  ellipse(x-140, height-30, 10, 10);
  triangle(x-180, height+25, x-170, height+15, x-160, height+25);
  triangle(x-160, height+25, x-150, height+15, x-140, height+25);
  triangle(x-140, height+25, x-130, height+15, x-120, height+25);
  x=x+y;
  stop=stop+change;
  start=start-change;
  if (start<0)
  {
    change=-.01;
  }
  if (start>.7)
  {
    change=.01;
  }
  if (x>500)
  {
    x=1;
    height=height+50;
  }
  if(height>450)
  {
    height=50;
  }
}
