
//Sarah C, CP1, 16/17

size(800,800);
noFill();
background(0);
int b=0;
int g=0;
int white=0;
int str=1;
while (white < 501)
{
  strokeWeight(str);
  stroke(255,255,255,50);
  ellipse(350,350,white,white);
  white=white+50;
  str=str+1;
}
while (b < 501)
{
  strokeWeight(1);
  stroke(129,240,250);
  ellipse(350,350,500,b);
  b=b+10;
}
while (g < 501)
{
  stroke(129,250,176);
  ellipse(350,350,g,500);
  g=g+20;
}
