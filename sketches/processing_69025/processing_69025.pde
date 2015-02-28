
//Martin C, CP1, Mods 4-5

size(800, 600);
background(121,232,33);

int xC = 400;
int yC = 300;

fill(0);
int v1 = 0;
int x6 = 50;
while(x6<4000)
{
  int y6 = v1*25-200;
  while(y6<4000)
  {
    fill(0,y6/10,0);
    ellipse(x6,y6,y6/10,y6/10);
    y6 = y6 + 100;
  }
  x6 = x6 + 100;
  v1 = v1 + 1;
}

strokeWeight(1);
noFill();
int x3 = 1;
while (x3<800)
{
  stroke(0,0,x3/4);
  ellipse(xC, yC, 800-x3, x3);
  x3 = x3 + 10;
}

noFill();
int x1 = 1;
while (x1<800)
{
  stroke(x1/4, 0, 0);
  bezier(xC-200, yC-200, x1, 0, 0, x1, xC+200, yC+200);
  x1 = x1 + 1;
}

int x2 = 1;
while (x2<800)
{
  stroke(x2);
  triangle(x2+200, x2+100, xC+x2, yC-x2, 700-x2, 500-x2);
  quad(x2+300, x2-300, 500, 700, 600, 300, x2-600, x2+100);
  x2 = x2 + 5;
}

int x4 = 200;
int y4 = -600;
int x5 = -200;
int y5 = 500;

while(x4<4000)
{
  strokeWeight(x4/200);
  stroke(x4/4,abs(y4)/4,y5);
  line(x4,y4,x5,y5);
  x4 = x4 + 10;
  y4 = y4 + 10;
  x5 = x5 + 10;
  y5 = y5 + 10;
}
