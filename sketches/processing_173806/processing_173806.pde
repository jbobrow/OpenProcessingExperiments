

float x, y;

void setup()
{
size(700, 700);
background(255);
strokeWeight(5);
x=width/2;
y=0;
stroke(#090758);
fill(255, 255, 0, 255);
}

void draw()
{
background(#090758);
text(mouseX+" "+mouseY, mouseX, mouseY);
ellipse(x, y, 100, 100 );
//triangle(x, y, 0, 0, random(500), random(500));
y= y+ 1;
if((width<x)||(height<y))
{
x=350;
y=0;
stroke(255);
fill(255);
}
}
