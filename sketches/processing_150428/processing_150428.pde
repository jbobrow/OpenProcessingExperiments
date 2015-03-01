
boolean pressed = true;
int i = 0;
void setup()
{
size(200, 200);
frameRate(50);
}

void draw ()
{ 
if (pressed)
{
if (i==0) 
{
background(255);
fill(255, 0, 0);
ellipse(width/2, height/2, width, height);
}
if (i==1)
{
background(255);
rectMode(CENTER);
fill(0, 255, 0);
rect(width/2, height/2, width-10, height-10);
}
if (i==2)
{
background(255);
fill(0, 0, 255);
triangle(width/2, 0, 0, height, width, height);
}
}
i++;
if (i==3)
i=0;
}

void mousePressed()
{
if (pressed)
{
pressed=false;
if (i>0)
i -=1;
else
i=2;
} 
else
pressed=true;
}

