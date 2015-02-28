
int a=400,b=25;
float c=9;
void setup()
{
size(401,400);
}
void draw()
{
background(15, 214, 26);
translate(200,200);
t(1);
c=c+.01;
if(mousePressed)b=mouseX;
}
void t(int d)
{
if(d<a)
{
ellipse(a*sin(d/c)/3,a*cos(b*d)/3,9,9);
smooth ();
fill (250, 47, 40);
t(d+1);
}
}

