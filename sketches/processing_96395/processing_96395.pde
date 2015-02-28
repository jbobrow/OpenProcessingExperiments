
size(200,200);
background(0);
 
int x=-100;
int y=-100;
 
while( x<200) {
  ellipse (x+100,y+100,10,10);
  ellipse (-x+100,-y+100,10,10);
  ellipse (y+100,x+100,10,10);
  ellipse (-y+100,-x+100,10,10);
  x= x+10;
  y=x*x/100;
  
}
