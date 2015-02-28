
Planet sun = new Planet(320, 580, 580, 0, #ff8c00);
Planet moon = new Planet (8, 300, 230, 0, #f8f8ff);

PImage earth;
PFont font;

void setup()
{

  size(600, 600);
  fill(0);
  rect(0, 0, width, height);
  loadEarth();
  stars();
  sun.drawPlanet();
}


void draw()
{

  image(earth, 190, 210);
  moon.drawPlanet();
  endOfUniverse();
}



public void loadEarth()
{
  earth = loadImage("Earth.jpg");
  earth.resize(250, 250);
}



public void stars()
{


  fill(248, 248, 255);

  for (int i=0;i<50;i++)
  {

    ellipse(random(width), random(height), 2, 2);
  }
}


class Planet
{

  int planetSize = 0;


  float xPos = 0;
  float yPos = 0;
  float angle = 0;
  color colour;


  public Planet(int s, float x, float y, float a, color c)
  {

    planetSize = s;
    xPos = x;
    yPos = y;
    angle = a;
    colour = c;
  }

  public void drawPlanet()
  {

    noStroke();
    fill(colour);
    ellipse(xPos, yPos, planetSize, planetSize);

    xPos = xPos + cos(radians(angle));
    yPos = yPos + sin(radians(angle));

    angle++;
  }

  public void planetColour(color c)
  {
    colour = c;
  }
}


public void endOfUniverse()
{

  int s = second();  
  int xPos=0;

  for (int i = 0; i < 250; i++)
  {
    if (s == 30)
    {
      fill(#b22222);
      ellipse(xPos, random(height), 20, 20);
      earth.resize(0, 0);
      moon.planetColour(#b22222);
    }
    xPos+= 4;
  }
}


