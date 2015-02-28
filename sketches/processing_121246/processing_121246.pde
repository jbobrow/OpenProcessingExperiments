
Meteor m1 = new Meteor();

void setup()
{
    size(displayWidth, displayHeight);


}


void draw()
{
    background(255, 255, 255);

    m1.asteroide(0);

}




class Meteor
{



    float x = -100;
    float y = 0;
    float speed = 0;


    void ting(int n)
    {
        for (int i = 0; i < n; i = i + 1)
        {
            asteroide(random(133));

        }


    }




    void asteroide(float farve)
    {
        stroke(farve, farve, farve);
        fill(farve, farve, farve);
        y = y + speed;
        //den ser hvis den er ude af skermen og hvis den er for den en ny x akse værdi 
        if (x == -100)
        {
            speed = random(1, 5);
            x = random(displayWidth);
        }
        if (y > displayHeight)
        {
            x = -100;
            y = 0;

        }

        y = y + speed;

        rect(x, y, 10, 10);

    }
}
