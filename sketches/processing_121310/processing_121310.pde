
void setup()
{
    size(500, 500);
    background(255);
}

void draw()
{
    if (second() < 30)
    {
        background(0, 100, 255);
    }
    else if (second() >= 30)
    {
        background(255, 100, 0);
    }
    
    translate(width/2, height/2);
    float s = map(second(), 0, 60, 0, 2*PI);
    rotate(s);
    translate(0, -200);
    fill(255);
    noStroke();
    ellipse(0, 0, 50, 50);
}    
