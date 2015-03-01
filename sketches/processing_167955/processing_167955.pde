
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
r=random(0,150);
g=random(0,50);
b=random(0,50);
stroke(0);
fill(r,g,b);
rect(x,y,50,50);
x=x+50;
if(x==width)
{
y=y+50;
x=0;
}
}
  

