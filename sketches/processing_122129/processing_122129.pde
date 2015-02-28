
Planet sun;
Planet mercury;
Planet venus;
Planet earth;
Planet luna;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptune;
Planet pluto;


void setup()
{
    size(300, 500);
    frameRate(60);

    sun = new Planet(0, 0, 0.1875, color(222, 222, 222));
    mercury = new Planet(20, 0, 0.002569, color(111, 111, 111));
    venus = new Planet(40, 0, 0.00616, color(25, 25, 25));
    earth = new Planet(60, 0, 0.006819, color(0, 0, 0));
    luna = new Planet(80, 0, 0.001126, color(50, 50, 50));
    mars = new Planet(100, 0, 0.002577, color(125, 0, 99));
    jupiter = new Planet(120, 0, 0.017215, color(0, 80, 75));
    saturn = new Planet(140, 0, 0.00725, color(10, 200, 50));
    uranus = new Planet(160, 0, 0.006035, color(25, 35, 15));
    neptune = new Planet(180, 0, 0.007743, color(80, 0, 80));
    pluto = new Planet(200, 0, 0.000457, color(90, 5, 45));
}

void draw()
{
    background(255, 255, 255);

    sun.display();
    sun.movement();

    mercury.display();
    mercury.movement();

    venus.display();
    venus.movement();

    earth.display();
    earth.movement();

    luna.display();
    luna.movement();

    mars.display();
    mars.movement();

    jupiter.display();
    jupiter.movement();

    saturn.display();
    saturn.movement();

    uranus.display();
    uranus.movement();

    neptune.display();
    neptune.movement();

    pluto.display();
    pluto.movement();
}
class Planet
{
    float xPos = 0;
    float yPos = 0;
    float xSpeed = 0;
    float ySpeed = 0;
    float c = 0;


    Planet(int x, float y, float a, color colour)
    {
        xPos = x;
        yPos = y;
        ySpeed = a;
        c = colour;
    }

    void display()
    {
        fill(c);
        stroke(c);
        rect(xPos, yPos, 10, 10);
    }

    void movement()
    {
        yPos = yPos + ySpeed;
    }

}


