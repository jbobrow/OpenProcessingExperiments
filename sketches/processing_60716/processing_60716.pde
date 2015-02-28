
int WIDTH = 580;
int HEIGHT = 580;
boolean flicker = true;

int[] x = new int[20];
int[] y = new int[20];

void setup()
{
    size (WIDTH, HEIGHT);
    rectMode(CENTER);
    frameRate(40);
    for (int i = 0; i < 20 i++)
    {
        x[i] = 0;
        y[i] = 0;
    }
}

void draw()
{
    background(0);
    rect(mouseX,mouseY,20,20);
    rect(pmouseX,pmouseY,15,15);
    fill(0,0,225);
    
    if (flicker == true)
    {
    rect(pmouseX + random(50) - 25,pmouseY + random(50) - 25,10,10);
    rect(pmouseX + random(50) - 25,pmouseY + random(50) - 25,10,10);
    rect(pmouseX + random(50) - 25,pmouseY + random(50) - 25,10,10);
    flicker = false;
    }
    else if (flicker == false)
    {
    flicker = true;
    }
}
