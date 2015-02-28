
class meteor
{
    color c;
    float xpos = random(30, 450);
    float ypos;
    float yspeed;
 
    meteor()
    {
        c = color(255);
        ypos = 0;
        yspeed = 5;
    }
 
    void display()
    {
        fill(0);
        rect(xpos, ypos, 30, 30);
    }
 
    void drive()
    {
 
        ypos = ypos + yspeed;
        if (ypos > 500)
        {
            ypos = 0;
            xpos = random(30, 470);
            yspeed= (yspeed +0.5);
        }
    }
}
meteor meteor1;
meteor meteor2;
meteor meteor3;
void setup()
{
    size(500, 500);
    meteor1 = new meteor();
    meteor2 = new meteor();
    meteor3 = new meteor();
}
void draw()
{
 
    background(255);
    meteor1.drive();
    meteor1.display();
    meteor2.drive();
    meteor2.display();
    meteor3.drive();
    meteor3.display();
}

