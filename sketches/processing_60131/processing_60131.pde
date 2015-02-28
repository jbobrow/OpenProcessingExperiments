
void setup()
{
    size(255,255);
    colorMode(HSB);
    background(255);
    ran();
}

void draw()
{
    if(mousePressed)
    {
        ran();
    }
    if(keyPressed)
    {
        run();
    }
}

void ran()
{
    int ne = random(0,255);
    for(int i = 0; i < 255; i++)
    {
        stroke(ne,255,i);
        line(0,i,255,i);
    }
}

void run()
{
    background(255);
    for(int i = 0; i < 255; i++)
    {
        for(int e = 0; e < 255; e++)
        {
            stroke(i,255,e);
            point(i,e);
        }
    }   
}
