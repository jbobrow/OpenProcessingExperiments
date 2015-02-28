
size(500,500)
line(0,y,500);
int y=20;
int x=20;
while(y<500)
{stroke(0,y,y);
line(x,0,500,y);
stroke(y,0,y),
line(0,y,x,500);
stroke(0,0,0);
line(0,y,500,y);
x=x+3;
y=y+3;
}
