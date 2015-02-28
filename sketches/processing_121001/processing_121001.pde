
// objekterne
Firkant myFirkant1;
Firkant myFirkant2;
Firkant myFirkant3;
Firkant myFirkant4;
Firkant myFirkant5;
Firkant myFirkant6;



void setup()
{

    size(500, 500);

    // initialiseringen
    myFirkant1 = new Firkant();
    myFirkant2 = new Firkant();
    myFirkant3 = new Firkant();
    myFirkant4 = new Firkant();
    myFirkant5 = new Firkant();
    myFirkant6 = new Firkant();

}



void draw()
{

    background(255);
    //call objecterne
    myFirkant1.display();
    myFirkant1.fall();

    myFirkant2.display();
    myFirkant2.fall();

    myFirkant3.display();
    myFirkant3.fall();

    myFirkant4.display();
    myFirkant4.fall();

    myFirkant5.display();
    myFirkant5.fall();

    myFirkant6.display();
    myFirkant6.fall();

}
class Firkant
{
    //variabler til klassen, data
    float xPos;
    float yPos;
    float ySpeed;
    float rectsize;



    //constructor her giver jeg variablerne værdier
    Firkant()
    {
        xPos = random(0, width);
        yPos = 0 + random(-250, -1);
        ySpeed = random(1, 5);
        rectsize = random(5, 15);
    }

    //her bliver firkanten tegnet
    void display()
    {
        fill(0);
        rect(xPos, yPos, rectsize, rectsize);
    }

    //Fald speed
    void fall()
    {
        yPos = yPos + ySpeed;

        //fuctionen der gentager det hele
        if (yPos > height)
        {
            xPos = random(0, width);
            yPos = 0 + random(-250, -1);
            ySpeed = random(1, 5);
            rectsize = random(5, 15);
        }

    }



}


