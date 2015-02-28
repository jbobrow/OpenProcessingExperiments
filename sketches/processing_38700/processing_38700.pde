
void setup()
{ size(680,400);
smooth();}

void draw()
{if (mousePressed)
    {fill(150);}
else
    {fill(255);}
    rect (mouseX,mouseY,100,20);
    ellipse(mouseX,mouseY,20,20);


}

