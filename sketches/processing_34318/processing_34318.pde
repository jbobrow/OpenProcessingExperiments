
class Particle {

  int index;
  float theta;
  float stride;
  float maxSpeed = 5;
  float maxChaos = 10;
  PVector accel, vel, pos;


  Particle(float startX, float startY, int index) {
    this.index = index;
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(startX, startY);
  } 

  void update(float stride, PVector target, float chaos) {
    this.stride = stride;
    stroke(50*(noise(pos.x)), 0, 50*(noise(pos.x)), 255);
    accel = noiseDir(chaos);
    accel.add(followDir(target));
    restrainCoors();
    vel.add(accel);
    float speed = noise(pos.x, pos.y) * maxSpeed;
    vel.limit(speed);
    pos.add(vel);
  }
  void restrainCoors() {
    if (pos.x > width) pos.x = 0;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
  PVector noiseDir(float chaos) {
    theta = abs(noise(pos.x, pos.y)) * 180;
    float x = pos.x + stride * cos(theta);
    float y = pos.y + stride * sin(theta);
    PVector dir = new PVector(x - pos.x, y - pos.y);
    dir.normalize();
    dir.mult(chaos * maxChaos);
    return dir;
  }

  PVector followDir(PVector target) {
    PVector dir = new PVector(target.x - pos.x, target.y - pos.y);
    dir.normalize();
    dir.mult(5);
    return dir;
  }
}


