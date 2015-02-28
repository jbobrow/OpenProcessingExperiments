
  
class Planet {
  color c; // color variable
  float planetX; // x variable of planet location
  float planetY; // y variable of planet location
  float planetSize; // diameter of planet
  
  // Planet object requires input of a color variable (RGB for example), and floats for planet's x,y locations and diameter
  Planet(color tempC, float tempPlanetX, float tempPlanetY, float tempPlanetSize) {
    c = tempC;
    planetX = tempPlanetX;
    planetY = tempPlanetY;
    planetSize = tempPlanetSize;
  }
  
  void display() {
    noStroke();
    ellipseMode(CENTER);
    frameRate(30);
    smooth();
    fill(c);
    ellipse(planetX,planetY, planetSize, planetSize);
  }
  
  void move(float posX, float posY) {
    float dif = planetY - posY;
    if (abs(dif) > 1) {
      planetY -= dif/2;
    }
    dif = planetX - posX;
    if (abs(dif) > 1) {
      planetX -= dif/2;
    }
  }
}

