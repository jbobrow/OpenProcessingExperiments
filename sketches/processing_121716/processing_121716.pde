
//Class til planeten
class Planet
{
  float a;
  float v = 0;
  float y = 0;
  float x;
  color c;

  Planet(float g, int nr, color farve)
  {
    x = displayWidth/11*nr;
    nr = nr;
    a = g;
    c = farve;
  }

  void showPlanet()
  {
    fill(c);
    ellipse(x, y, 20, 20);
  }

  void fall()
  {
    y = y + v;
    v = a+v;
  }
}

Planet solen;
Planet merkur;
Planet venus;
Planet jorden;
Planet maanen;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptun;
Planet pluto;


// Dette er Main
void setup()
{
  size(displayWidth, displayHeight);

  solen = new Planet(0.116906667, 1, color(255, 0, 0));
  merkur = new Planet(0.001579093, 2, color(0, 255, 0));
  venus = new Planet(0.003767467, 3, color(255, 100, 100)); 
  jorden = new Planet(0.004189867, 4, color(0, 30, 255));
  maanen = new Planet(0.0006912, 5, color(196, 196, 196));
  mars = new Planet(0.0015744, 6, color(255, 0, 0));
  jupiter = new Planet(0.009864533, 7, color(180, 0, 0));
  saturn = new Planet(0.003822933, 8, color(255, 150, 0));
  uranus = new Planet(0.003707733, 9, color(0, 155, 150));
  neptun = new Planet(0.004757333, 10, color(0, 50, 255));
  pluto = new Planet(0.000247467, 11, color(150, 50, 50));
}

void draw()
{
  background(0, 0, 0);

  solen.showPlanet();
  solen.fall();

  merkur.showPlanet();
  merkur.fall();

  venus.showPlanet();
  venus.fall();

  jorden.showPlanet();
  jorden.fall();

  maanen.showPlanet();
  maanen.fall();

  mars.showPlanet();
  mars.fall();

  jupiter.showPlanet();
  jupiter.fall();

  saturn.showPlanet();
  saturn.fall();

  uranus.showPlanet();
  uranus.fall();

  neptun.showPlanet();
  neptun.fall();

  pluto.showPlanet();
  pluto.fall();
}


