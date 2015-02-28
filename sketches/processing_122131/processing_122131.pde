
Firkant newFirkant1;
Firkant newFirkant2;
Firkant newFirkant3;
Firkant newFirkant4;
Firkant newFirkant5;
Firkant newFirkant6;


void setup()
{
    size(displayWidth, displayHeight);
    newFirkant1 = new Firkant();
    newFirkant2 = new Firkant();
    newFirkant3 = new Firkant();
    newFirkant4 = new Firkant();
    newFirkant5 = new Firkant();
    newFirkant6 = new Firkant();
    frameRate(60);
}

void draw()
{
    background(0);
    newFirkant1.drive();
    newFirkant1.tegn();
    newFirkant2.drive();
    newFirkant2.tegn();
    newFirkant3.drive();
    newFirkant3.tegn();
    newFirkant4.drive();
    newFirkant4.tegn();
    newFirkant5.drive();
    newFirkant5.tegn();
    newFirkant6.drive();
    newFirkant6.tegn();
}

class Firkant
{
    color c;
    float xpos, ypos, yspeed;

    Firkant()
    {
        xpos = random(displayWidth + 50);
        ypos = 0;
        yspeed = random(2, 7);
    }

    void tegn()
    {
        c = color(random(0, 255), 255 - xpos / 5, 100);


        fill(c);
        rect(xpos, ypos, 50, 50);
    }

    void drive()
    {
        ypos = ypos + yspeed;
        if (ypos > displayHeight)
        {
            ypos = 0;
            xpos = random(displayWidth);
        }
    }
}  
