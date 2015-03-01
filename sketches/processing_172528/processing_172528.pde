
int x=width/2;
int y=height/2;
void setup()
{
size(450,450);
}

void draw()
{
background(0);
fill(255,255,0);
ellipse(x,y, 25,25);
}

void keyPressed()
{
if(keyCode==UP)
{
y-=3;
}
if(keyCode==DOWN)
{
y+=3;
}
if(keyCode==RIGHT)
{
x+=3;
}
if(keyCode==LEFT)
{
x-=3;
}
}
