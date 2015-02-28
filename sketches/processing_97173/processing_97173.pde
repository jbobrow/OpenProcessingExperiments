
background(0,139,139,50);

int x=300;
int y=500;

size(x,y);

line(y/3,y/2,x/4,y);
line(x,y,0,x,x);
line(0,0,x/2,y/5);
line(x/2,y/5,x/1.9,y/5.3);
line(x/1.9,y/5.3,x/1.8,y/5);

//triangle//
noStroke(0);
fill(255,115,13,210);
triangle(x/2,y/2,x/2,y,x,y/2);

//ellipse//
fill(255,248,220);
ellipse(x/2,y/2,x/5,x/5);

//square//
fill(0,0,205,30);
rect(y/18,x/2,y/5,y/5);
