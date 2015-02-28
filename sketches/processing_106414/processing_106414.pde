
int x=50;
int y=20;
int dx=5;
int dy=3;

void setup()
{
size(400,500);
}



void draw()
{
background(255,255,255);
ellipse(x,y,20,20);
fill(255,200,200);
if(y>400,x>400)
{
dy=-dy;
dx=-dx
}

if(y<0,x<3)
{
dy=-dy;
dx=-dx;
}

y=y+dy;
x=x+2*dx;




}
