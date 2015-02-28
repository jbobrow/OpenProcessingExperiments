
//
// The beauty of the leapfrog algorithm
//

PImage img;
SolarSystem[] solarSystems = new SolarSystem[10];
float dt = 0.02;
int iterations = 1;
float planetsDiameter = 0.5;

public void setup() {
  // Image by Alex Proimos: http://www.flickr.com/photos/proimos/7810727314
  img = loadImage("http://farm9.staticflickr.com/8424/7810727314_b6149fb472_c.jpg");

  size(img.width, img.height);
  background(255);
  frameRate(500);
  smooth();

  // Initialize the solar systems
  for (int i = 0; i < solarSystems.length; i++) {
    PVector sunPos = new PVector(width*random(0.3, 0.7), height*random(0.3, 0.7));
    float sunMass = 3000000*random(0.5, 2);
    int nPlanets = int(random(5, 10));
    solarSystems[i] = new SolarSystem(sunPos, sunMass, nPlanets);
  }
}

public void draw() {
  // Paint all the solar systems
  for (int i = 0; i < solarSystems.length; i++) {
    solarSystems[i].paintPlanets(img, planetsDiameter);
    solarSystems[i].update(dt, iterations);
  }
}

public void mouseClicked(){
  // Clean the screen
  background(255);
  
  // Create a new set of solar systems
  for (int i = 0; i < solarSystems.length; i++) {
    PVector sunPos = new PVector(width*random(0.3, 0.7), height*random(0.3, 0.7));
    float sunMass = 3000000*random(0.5, 2);
    int nPlanets = int(random(5, 10));
    solarSystems[i] = new SolarSystem(sunPos, sunMass, nPlanets);
  }
}

