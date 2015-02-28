
Planet merkur;
Planet venus;
Planet jorden;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptun;
Planet pluto;
Planet solen;
Planet moon;


void setup()
{
    size(displayWidth, 800);
    merkur = new Planet(0.00165, width/12, color(0, 255, 0), "Merkur");
    venus = new Planet(0.00394, width/12*2, color(255, 100, 100), "Venus");
    jorden = new Planet(0.00464, width/12*3, color(0, 30, 255), "Jorden");
    mars = new Planet(0.00164, width/12*4, color(255, 0, 0), "Mars");
    jupiter = new Planet(0.0102, width/12*5, color(180, 0, 0), "Jupiter");
    saturn = new Planet(0.00398, width/12*6, color(255, 150, 0), "Saturn");
    uranus = new Planet(0.00386, width/12*7, color(0, 150, 180), "Uranus");
    neptun = new Planet(0.00495, width/12*8, color(0, 50, 255), "Neptun");
    pluto = new Planet(0.000258, width/12*9, color(150, 50, 50), "Pluto");
    solen = new Planet(0.121, width/12*10, color(255, 255, 0), "Solen");
    moon = new Planet(0.00072, width/12*11, color(196, 196, 196), "Månen");




}


void draw()
{
    background(0);

    merkur.tegn();
    merkur.fald();

    venus.tegn();
    venus.fald();

    jorden.tegn();
    jorden.fald();

    mars.tegn();
    mars.fald();

    jupiter.tegn();
    jupiter.fald();

    saturn.tegn();
    saturn.fald();

    uranus.tegn();
    uranus.fald();

    neptun.tegn();
    neptun.fald();

    pluto.tegn();
    pluto.fald();

    solen.tegn();
    solen.fald();

    moon.tegn();
    moon.fald();
}
class Planet
{

    float xPos;
    float yPos;
    float v;
    float a;
    color c;
    String planetNavn;


    Planet(float g, float x, color farve, String navn)
    {
        c = farve;
        xPos = x;
        yPos = 0;
        v = 0;
        a = g;
        planetNavn = navn;
    }


    void navn()
    {
        fill(255, 255, 255);
        text(planetNavn, xPos - 60, yPos);
    }
    void tegn()
    {
        fill(c);
        ellipseMode(CENTER);
        ellipse(xPos, yPos, 20, 20);

        navn();
    }

    void fald()
    {
        v = v + a;
        yPos = yPos + v;
    }
}


