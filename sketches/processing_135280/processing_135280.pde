
//Math 1 - Arithmetic, Functions
//Exercise #2
/*1. Use one variable to set the position and size for three ellipses.*/

int x = 50;
int y = 50;
int c = 50;

size(400,400);
fill(0);
ellipse(x,y,c,c);
x=x+x;
y=y+y;
c=c+c;
fill(100);
ellipse(x,y,c,c);
x=x+x;
y=y+y;
c=c+c;
fill(170);
ellipse(x,y,c,c);
x=x+x;
y=y+y;
c=c+c;
fill(255);
ellipse(x,y,c,c);


