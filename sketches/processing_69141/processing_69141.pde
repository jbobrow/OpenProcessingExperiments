
//ROWAN CASSIUS, CP1, B7
size(500,500);
noFill();
stroke(255,0,0);
background(0);
float r = 225.0;
float g = 0.0;
float b = 162.0;
float j = 40;
int i = 25;
int n= 200;
while(i<2501)
{
  r=r-250.0/100.0;
  g=g+250.0/100.0;
  stroke(r,g,b,n);
  ellipse(250,250,j,j);
  ellipse(250,250,j,400);
  ellipse(250,250,400,j);
  ellipse(250,250,j,350);
  ellipse(250,250,350,j);
  ellipse(250,250,j,300);
  ellipse(250,250,300,j);
  ellipse(250,250,j,250);
  ellipse(250,250,250,j);
  ellipse(250,250,j,200);
  ellipse(250,250,200,j);
  ellipse(250,250,j,150);
  ellipse(250,250,150,j);
  ellipse(250,250,j,100);
  ellipse(250,250,100,j);
  ellipse(250,250,j,50);
  ellipse(250,250,50,j);
 
  j=j+4;
  i=i+25;
}
