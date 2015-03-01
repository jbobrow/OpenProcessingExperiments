
float r;
float g;
float b;

int x=0;
int y=0;
void setup()
{
size(400,400);
background(0);
}
void draw()
{
r=random(199);
g=random(3);
b=random(255);
stroke(r,g,b);
fill(r,g,b);
rect(x,y,20,20);
x=x+20;
if(x==width)
{
y=y+20;
x=0;
}
}
