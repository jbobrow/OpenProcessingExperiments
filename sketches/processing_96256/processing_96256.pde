
void setup()
    {
    size(200,200);
    background(255);
    strokeWeight(10);
    frameRate(15);
    }
 
    int x=0;
    int y=255;
 
    void draw()
    {
    stroke(x,0,y);
    point(random(0,200),random(0,200));
    if(x <= 255)
    {
    x=x+7;
    y=y-7;
    }
    else
    {
    x=0;
    y=255;
    }
    }
