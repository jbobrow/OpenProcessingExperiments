
Meteor met1;
Meteor met2;
Meteor met3;
Meteor met4;
Meteor met5;
Meteor met6;

void setup()
{
    met1 = new Meteor();
    met2 = new Meteor();
    met3 = new Meteor();
    met4 = new Meteor();
    met5 = new Meteor();
    met6 = new Meteor();
    size(displayWidth, displayHeight);
}

void draw()
{
    background(0);
    met1.display();
    met1.fall();
    met2.display();
    met2.fall();
    met3.display();
    met3.fall();
    met4.display();
    met4.fall();
    met5.display();
    met5.fall();
    met6.display();
    met6.fall();
}


class Meteor
{
    float xPos;
    float yPos;
    float speed;

    Meteor()
    {
        xPos = random(0, displayWidth);
        yPos = 0;
        speed = random(2, 10);
    }

    void display()
    {
        fill(255);
        stroke(255);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 50, 50);
    }


    void fall()
    {
        if (yPos <= displayHeight + 50)
        {
            yPos = yPos + speed;
        }
        else
        {
            yPos = 0;
            xPos = random(0, displayWidth);
        }
    }
}
