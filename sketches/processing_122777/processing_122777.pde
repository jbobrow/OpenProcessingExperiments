
float startx = 50;
float starty = 50;
float tid = 0;
boolean active = false;

void setup()
{
    size(800, 600);
    frameRate(60);
    ellipseMode(CENTER);
}

void draw()
{
    background(255);
    fill(0);

    if (active)
    {
        tid += 0.01666666666666666666666666666667;
    }

    if (keyPressed)
    {
        if (keyCode == UP)
        {
            tid -= 0.01666666666666666666666666666667;
        }
        if (keyCode == DOWN)
        {
            tid += 0.01666666666666666666666666666667;
        }
    }
    ellipse(startx, ypos() - 10, 20, 20);
    line(65, 50, 75, 50);
    line(65, ypos(), 75, ypos());
    line(70, 50, 70, ypos());
    line(0, 50 + 120, 100, 50 + 120);

    text(round(tid * tid * 4.91 * 100) + " cm", 80, 60);
    text(round(tid * tid * 4.91) + " m", 80, 75);
    text(floor(tid * tid * 4.91 / 1000) + " km", 80, 90);
    text(tid + " sekunder", 10, 20);
    text(tid * 9.82 + " m/s", 80, 105);
}

float ypos()
{
    float bla = starty + (tid * tid * 4.91 * 10);
    return bla;
}

void keyPressed()
{
    if (keyCode == ' ')
    {
        if (active)
        {
            active = false;
        }
        else
        {
            active = true;
        }
    }
}
