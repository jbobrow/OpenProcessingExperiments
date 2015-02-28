
class Fishy {
  float angle;
  float angleStep = 0.05;
  float radius;
  float radFlux;
  float radFluxRange = 20;
  float seed = random(0, 10000);
  float stepVal = 0.01;
  float newRad;
  
  Fishy(float _angle, float _radius) {
    angle = _angle;
    radius = _radius;
  }
  
  void update() {
    radFlux = noise(seed);
    seed += stepVal;
    radFlux = map(radFlux, 0, 1, -radFluxRange, radFluxRange);
    newRad = radius + radFlux;
    angle += angleStep + random(-0.2, 0.2);
  }
  
  void draw() {
    noFill();
    stroke(255);
    arc(hWidth, fifthHeight * 2, newRad, newRad, radians(angle), radians(angle + 1));
  }
}

