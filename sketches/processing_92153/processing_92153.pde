
void setup()
{size(500,500);}

void draw()
{if(mousePressed)
    {background(255);}
 else
    {fill(mouseX-200, mouseY-200, (mouseX+mouseY)/6);
     ellipse(mouseX,mouseY,50,50);}
}
