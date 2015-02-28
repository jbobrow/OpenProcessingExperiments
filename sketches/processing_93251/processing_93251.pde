
size(200,200);
background(100);
int x=-100;
int y=-100;
while(x<200) {
  rect(x+100,y+100,10,10);
  rect(-x+100, -y+100, 10,10);
  rect(y+100, x+100, 10,10);
  rect(-y+100, -x+100,10,10);
  x=x+10;
  y=x*x/100;
}
