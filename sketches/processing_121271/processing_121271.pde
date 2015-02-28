
// Learning Processing Exercise 14-10. A solar system with moons.

Planet[] planets = new Planet[8];

void setup() {
  size(400, 400, P3D);
  for (int i = 0; i < planets.length; ++i) {
    planets[i] = new Planet(40 + i * 20, i + 8, 2);
  }
}

void draw() {
  background(200);
  translate(width / 2, height / 2);
  stroke(0);
  fill(255);
  ellipse(0, 0, 20, 20);
  for (int i = 0; i < planets.length; ++i) {
    planets[i].update();
    planets[i].draw();
  }
}

class Planet {

  float theta;
  float diameter;
  float distance;
  float orbitSpeed;

  Moon[] moons;

  Planet(float distance, float diameter, int numberOfMoons) {
    this.distance = distance;
    this.diameter = diameter;
    theta = 0;
    orbitSpeed = random(0.01, 0.03);
    moons = new Moon[numberOfMoons];
    for (int i = 0; i < moons.length; ++i) {
      moons[i] = new Moon(diameter + i * 5, i + 2);
    }
  }

  void update() {
    theta += orbitSpeed;
    for (int i = 0; i < moons.length; ++i) {
      moons[i].update();
    }
  }

  void draw() {
    pushMatrix();
    rotate(theta);
    translate(distance, 0);
    stroke(0);
    fill(175);
    ellipse(0, 0, diameter, diameter);
    for (int i = 0; i < moons.length; ++i) {
      moons[i].draw();
    }
    popMatrix();
  }

}

class Moon extends Planet {

  Moon(float distance, float diameter) {
    super(distance, diameter, 0);
  }
  
}

