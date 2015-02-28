
int x=-10;
int y=7;
int i;
int c;
void setup()
{
  smooth();
  size(500, 500);
background(255);
  strokeWeight(3);
  noFill();
}

void draw()
{
  translate(640,-20);
  for (i=0;i<=width;i+=5)
  {
    translate(x, y);
    c++;
    colorStroke();
    bezier(-600,0,-533,-30,-466,30,-400,0);
    bezier(-400,0,-333,-30,-266,30,-200,0);
    bezier(-200,0,-133,-30,-66,30,0,0);
    bezier(0, 0, 67, -30, 132, 30, 200, 0);
    bezier(200, 0, 267, -30, 332, 30, 400, 0);
    bezier(400, 0, 467, -30, 532, 30, 600, 0);
  }
  noLoop();
}

void colorStroke()
{
  if(c%8==0||c%8==1)
  {
    stroke(216,56,15);
  }
  if(c%8==2||c%8==7)
  {
    stroke(89,142,41);
  }
  if(c%8==3||c%8==6)
  {
    stroke(66,151,224);
  }
  if(c%8==4||c%8==5)
  {
    stroke(255,0,0);
  }
}
    

