
size(200,200);
background(255);
int x=0;
int y=0;
stroke(20,20,100);
fill(20,100,20);
strokeWeight(2);
for (x=0;x<200; x=x+10)
for (y=200;y>0; y=y-10)
rect(x,x,y,y);
