
int x = 0;
int a=250;
int d=250;
int c = 0;
int v = 1;
void setup()
{
  size(500, 500);
  stroke(255, 255, 255);
  noFill();
  background(0, 0, 0);
}
void draw()
{
  fill(0, 0, 0, 10);
  rect(0, 0, 500, 500);
  ellipse(x, 50, 20, 20);
  x = x + 5;
}
void mouseDragged()
{
  stroke(255);
  line(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(500-mouseX, mouseY, 10, 10);
  ellipse(a, d, 30, 30);
  a= a+ 5;
  d=d+5;
  ellipse(500-a, 500-d, 30, 30);
}
void keyPressed()
{
  if ( key=='q')
    stroke(v, 121, 66, 193);
  rect(mouseX, mouseY, 20, 20);
  v= v+ 5;
  if (key=='w')
    stroke(x, x, x);
  line(mouseX, mouseY, 0, 0);
  rect(mouseX, mouseY, 20, 20);
  x=x+1;
  if (key=='e')
    stroke(80, x, 193);
    if (key=='r')
    stroke(121, 66, 193);
  if (key=='t')
    stroke(219, 40, 46);
  line(mouseX, mouseY, 500, 500);
  rect(mouseX, mouseY, 20, 20);
  x=x+20;
 
}
