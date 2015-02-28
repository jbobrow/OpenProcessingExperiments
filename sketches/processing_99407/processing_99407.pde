
boolean isRed;
int x;
int y;
void setup() 
{
isRed = true;
size(450, 450);
}

void draw() 
{
background( 255 );
fill(0);
stroke(255, 0, 0);
ellipse(225, 225, 30,30);
x=mouseX;
y=mouseY;
fill(255, 0, 0);
if (mouseX-40<0)
{
    x=40;
    y=mouseY;
     
}
if (mouseX+40>450)
{
    x=410;
    y=mouseY;
     
}
if (mouseY-40<0)
{
    x=mouseX;
    y=40;   
}
if (mouseY+40>450)
{
    x=mouseX;
    y=410;   
}
if (mouseX-40<0 && mouseY-40<0)
{
    x=40;
    y=40;
}
if (mouseX+40>450 && mouseY+40>450)
{
x=410;
y=410;
}
if (mouseX-40<0 && mouseY+40>450)
{
x=40;
y=410;
}
if (mouseY-40<0 && mouseX+40>450)
{
x=410;
y=40;
}
ellipse(x,y,80,80);
}
