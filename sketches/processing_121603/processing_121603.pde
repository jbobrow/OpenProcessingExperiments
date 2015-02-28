
Planet solen;
Planet merkur;
Planet venus;
Planet jorden;
Planet moon;
Planet mars;
Planet jupitor;
Planet saturn;
Planet uranus;
Planet neptun;
Planet pluto;

void setup()
{

    size(1200, 600);
    solen = new Planet(width / 12, 274, color(255, 255, 0), "Sol");
    merkur = new Planet(width / 12 * 2, 3.701, color(0, 255, 0), "Merkur");
    venus = new Planet(width / 12 * 3, 8.83, color(255, 100, 100), "Venus");
    jorden = new Planet(width / 12 * 4, 9.82, color(0, 30, 255), "Jorden");
    moon = new Planet(width / 12 * 5, 1.62, color(196, 196, 196), "Moon");
    mars = new Planet(width / 12 * 6, 3.69, color(255, 0, 0), "Mars");
    jupitor = new Planet(width / 12 * 7, 23.12, color(180, 0, 0), "Jupitor");
    saturn = new Planet(width / 12 * 8, 8.96, color(255, 150, 0), "Saturn");
    uranus = new Planet(width / 12 * 9, 8.69, color(0, 155, 150), "Uranus");
    neptun = new Planet(width / 12 * 10, 11.15, color(0, 50, 255), " Neptun");
    pluto = new Planet(width / 12 * 11, 0.58, color(150, 50, 50), "Pluto");
}




void draw()
{
    background(0);
    solen.samlet();
    merkur.samlet();
    venus.samlet();
    jorden.samlet();
    moon.samlet();
    mars.samlet();
    jupitor.samlet();
    saturn.samlet();
    uranus.samlet();
    neptun.samlet();
    pluto.samlet();




}
class Planet
{
    float xPos;
    float yPos;
    float v;
    float a;
    color c;
    String planetnavn;


    Planet(float x, float g, color farve, String navn)
    {
        c = farve;
        xPos = x;
        yPos = 0;
        v = 0;
        g = g / 3600 * 1.2;
        a = g;
        planetnavn = navn;




    }

    void display()
    {
        fill(c);
        ellipse(xPos, yPos, 15, 15);
    }


    void fall()
    {
        yPos = yPos + v;
        v = v + a;


    }
    void navn()
    {
        fill(255, 255, 255);
        text(planetnavn, xPos - 60, yPos);
    }

    void samlet()
    {
        display();
        fall();
        navn();
    }

}


