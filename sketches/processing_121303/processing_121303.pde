
void setup()
{
    size(500, 500);
    background(255);
}

void draw()
{
    if (mouseX >= 250)
    {
        background(0, 100, 255);
    }
    else if (mouseX < 250)
    {
        background(255, 100, 0);
    }
    
    stroke(255);
    line(250, 0, 250, 500);
}    
