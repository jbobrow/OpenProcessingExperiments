
//nye meteorer
Meteor nyMeteor1;

Meteor nyMeteor2;

Meteor nyMeteor3;

Meteor nyMeteor4;

Meteor nyMeteor5;

void setup() 
{
    size(300, 300);
    nyMeteor1 = new Meteor();
    
    nyMeteor2 = new Meteor();
    
    nyMeteor3 = new Meteor();
    
    nyMeteor4 = new Meteor();
    
    nyMeteor5 = new Meteor();
}

void draw() 
{
    background(255, 255, 255);
    nyMeteor1.movement();
    nyMeteor1.Meteoren();
    
    nyMeteor2.movement();
    nyMeteor2.Meteoren();
    
    nyMeteor3.movement();
    nyMeteor3.Meteoren();
    
    nyMeteor4.movement();
    nyMeteor4.Meteoren();
    
    nyMeteor5.movement();
    nyMeteor5.Meteoren();
}

//class

class Meteor 
{

    float xPos;
    float yPos;
    float r;
    float ySpeed;
    color farve;

Meteor()
    {
        farve = 255;
        r = 50;
        xPos = random(25, 275);
        yPos = 0;
        ySpeed = random(5, 10);
    }
    
    void Meteoren() 
    {
        fill(farve);
        stroke(0, 0, 0);
        ellipse(xPos, yPos+ySpeed, r, r);
    }
    
    void movement() 
    {
        yPos = yPos + ySpeed;
        
        if (yPos >= 300+25); 
        {
            xPos = random(25, 275);
            yPos = random(0);
            r = 50;
            ySpeed = random(5,10);
            farve = 255;
        }
    }
}

