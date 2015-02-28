
class meteor
{
    color c;
    float xpos = random(30, 470);
    float ypos;
    float yspeed;

    meteor()
    {
        c = color(255);
        ypos = -20;
        yspeed = 5;
    }

    void display()
    {
        fill(0);
        ellipse(xpos, ypos, 30, 30);
    }

    void drive()
    {

        ypos = ypos + yspeed;
        if (ypos > 500)
        {
            ypos = -20;
            xpos = random(30, 470);
        }
    }
}
meteor minmeteor;
meteor meteor2;
meteor meteor3;
void setup()
{
    size(500, 500);
    minmeteor = new meteor();
    meteor2 = new meteor();
    meteor3 = new meteor();
}
void draw()
{

    background(255);
    minmeteor.drive();
    minmeteor.display();
    meteor2.drive();
    meteor2.display();
    meteor3.drive();
    meteor3.display();
}
