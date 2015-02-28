
class Ball {
  PVector pos, pPos, vel, acc;
  float damp, rad;
  color c;

  Ball(float xPos, float yPos) {
    pos = new PVector(xPos, yPos);
    pPos = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    damp = 0.99;
    c = color(107, 127, 114, 128);
    rad = 5;
  }

  void update() {
    vel.add(acc);
    vel.mult(damp);
    pPos.set(pos.x, pos.y, 0);
    pos.add(vel);
    acc.set(0, 0, 0);

    walls();
  }

  //add perlin-based movement for green circles
  void addPerlin() {
    float depth = 0.006;
    float bright = 15 * noise(pos.x * depth, pos.y * depth, newNoiseSeed);
    PVector perlin = new PVector( cos(bright), sin(bright) );
    perlin.mult(0.1);
    acc.add(perlin);
    vel.limit(40);
  }

  //display the green circles
  void display() {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, 10, 10);
  }


  //if object hits screen edge, it will reverse its velocity
  void walls() {
    if (pos.x > width - rad) {
      pos.x = width - rad;
      vel.x *= -1;
    } 
    if (pos.x < rad) {
      pos.x = rad;
      vel.x *= -1;
    } 
    if (pos.y > height - rad) {
      pos.y = height - rad;
      vel.y *= -1;
    } 
    if (pos.y < rad) {
      pos.y = rad;
      vel.y *= -1;
    }
  }
}


