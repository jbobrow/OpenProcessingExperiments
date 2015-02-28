
class VerletBall {

  PVector pos, posOld;
  PVector accel;
  float bounce;
  float radius;
  float timeStep;
  float damping = .99;

  VerletBall() {
  }

  VerletBall(PVector pos, PVector accel, float bounce, float radius, float timeStep) {
    this.pos = pos;
    posOld = new PVector(pos.x, pos.y);
    this.accel = accel;
    this.bounce = bounce;
    this.radius = radius;
    this.timeStep = timeStep;
    pos.x += 5;
    pos.y += 5;
  }

  void verlet() {
    PVector posTemp = new PVector(pos.x, pos.y);
    accel.x = random(-23.5, 23.5);
    accel.y = random(-23.5, 23.5);

    pos.x += (pos.x-posOld.x) + accel.x*(timeStep*timeStep);
    pos.y += (pos.y-posOld.y) + accel.y*(timeStep*timeStep);
    posOld.set(posTemp);
  }

  void render() {
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
}



