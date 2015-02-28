
// Learning Processing Exercise 14-11. A 3D solar system with moons.

Planet[] planets = new Planet[8];

void setup() {
  size(400, 400, P3D);
  for (int i = 0; i < planets.length; ++i) {
    planets[i] = new Planet(40 + i * 20, i + 8, 2);
  }
}

void draw() {
  background(33);
  noStroke();
  lights();
  translate(width / 2, height / 2);
  rotateX(PI / 3);
  fill(200, 200, 0, 127);//stroke(200, 200, 0, 127);
  sphere(20);
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
    noStroke();
    fill(175, 127);
    sphere(diameter);
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

