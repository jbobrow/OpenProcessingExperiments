
size(400,400);background(77,24,24);
int x; x=10;
int y; y=x*4;
stroke(24,77,77);strokeWeight(x/2);noFill();
line(x,x,y+x,y+10);strokeWeight(x*2);line(y+x,y+10,(y+x)*3,(y+10)*3);
strokeWeight(x);line((y+x)*3,(y+10)*3,(y+x)*6,(y+10)*6);
strokeWeight(2);stroke(53,176,176);ellipseMode(RADIUS);
ellipse((y+x)*2,(y+10)*2,(y+x)*2,y+10);


