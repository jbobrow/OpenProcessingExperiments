
Cirkel myCirkel;

void setup()
{


    size(1200, 600);
    myCirkel = new Cirkel();


}




void draw()
{
    background(255);

    myCirkel.display();
    myCirkel.fall();



}
class Cirkel
{
    float xPos;
    float yPos;
    float v;
    float a;
    float tid;
    float aVandret;
    float vVandret;




    Cirkel()
    {
        xPos = 30;
        yPos = 0 - 7.5;
        v = 0;
        a = 0.818;
        vVandret = 3.33333;
        tid = 0;



    }

    void display()
    {
        fill(0);
        ellipse(xPos, yPos, 15, 15);
        text("Time" + " " + nf(tid / 60,1,2), 400, 60);
    }


    void fall()
    {
        yPos = yPos + v;
        v = v + (a / 60);
        tid = tid + 1;

        xPos = xPos + vVandret;




        if (yPos > height - 7.5)
        {
            noLoop();

        }

    }



}


