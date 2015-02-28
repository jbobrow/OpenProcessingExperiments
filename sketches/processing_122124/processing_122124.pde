
Fald f1 = new Fald();
Fald f2 = new Fald();
Fald f3 = new Fald();
Fald f4 = new Fald();
Fald f5 = new Fald();
Fald f6 = new Fald();
Fald f7 = new Fald();
Fald f8 = new Fald();
Fald f9 = new Fald();
Fald f10 = new Fald();
Fald f11 = new Fald();


void setup()
{
    size(1200, 1000);

}


void draw()
{
    background(255);
    //g,x,y,skermx,højte
    f1.boldFald(3.61, 50, 0, 600, 500, "mercur");
    f2.boldFald(8.83, 150, 0, 600, 500, "venus");
    f9.boldFald(9.82, 250, 0, 600, 500, "jord");
    f3.boldFald(3.75, 350, 0, 600, 500, "mars");
    f4.boldFald(26, 450, 0, 600, 500, "jupiter");
    f5.boldFald(11.2, 550, 0, 600, 500, "saturn");
    f6.boldFald(10.5, 650, 0, 600, 500, "uranus");
    f7.boldFald(13.3, 750, 0, 600, 500, "neptune");
    f8.boldFald(0.61, 850, 0, 600, 500, "pluto");
    f10.boldFald(9.82, 250, 0, 600, 500, "moon");




}

class Fald
{
    float speed = 0;
    float pixelm = 0;
    float speed2 = 0;
    float v = 0;
    float starty = 0;
    void boldFald(float g, float x, float y, float skermx, float hojte, String name)
    {
        pixelm = hojte / skermx;
        speed = g / (1 / pixelm);
        speed2 = speed / 3600;


        v = v + speed2;
        starty = starty + v;

        fill(0);
        text(name, x, starty - 30);
        ellipse(x, starty, 20, 20);

        if (starty > displayHeight)
        {
            starty = y;

            v = 0;

        }




    }




}
