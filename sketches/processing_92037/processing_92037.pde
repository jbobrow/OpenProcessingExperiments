
size(200,200);
background(255,0,0);
int x=-100;
int y=100;
while (x<=100) {
 point (x+100, (x*x/100)+100);
 point((x*x/100)+100,x+100);
 
  point (-x+100, -(x*x/100)+100);
 point(-(x*x/100)+100,-x+100);
 
  point((x*x/100)+100,x+100);
  point (x+100, (x*x/100)+100);
 
 point(-(x*x/100)+100,-x+100);
  point (-x+100, -(x*x/100)+100);
 x=(x+2);
 }
