
float x, y;

void setup()
{
size(700, 700);
background(255);
strokeWeight(5);
x=0;
y=0;
}

void draw()
{
background(255);
stroke(random(255),random(255),random(255));
fill(random(255), random(255), random(255), random(255));
ellipse(x, y, 100, 100);
triangle(x, y, 0, 0, random(500), random(500));
x= x+ 1;
y= y+ 1;
if((width<x)||(height<y))
{
x=random(0, width);
y=random(0, height);
}
}
