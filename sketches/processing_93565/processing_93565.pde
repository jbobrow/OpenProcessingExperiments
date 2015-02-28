
size(200,200);
background(73,119,214);
 
int x=-100;
int y=-100;
 
while( x<200) {
  fill (10,182,242);
  ellipse (x+100,y+100,10,10);
  ellipse (-x+100,-y+100,10,10);
  ellipse (y+100,x+100,10,10);
  ellipse (-y+100,-x+100,10,10);
  x= x+10;
  y=x*x/100;
  
}
