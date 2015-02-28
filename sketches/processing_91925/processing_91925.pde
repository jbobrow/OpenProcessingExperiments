
int y=10;
int x;

void setup()
{
size(200,200);
background(0);
}

void draw()
{
fill(224,52,127);
for(x=10;x<200;x=x+20)
{
ellipse(x,y,20,20);
}
y=y+20;
}
