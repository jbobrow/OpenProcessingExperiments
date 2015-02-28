
class Particle {
  PVector location;
  PVector velocity;
  PVector gravity;
  PVector origlocation;
  PVector temp;

  float age;

  Particle(float vx, float vy) {

    gravity = new PVector(3,3);

    origlocation = new PVector(random(200,300),random(200,300));
    location = new PVector(random(200,300),random(200,300));

    velocity = new PVector(vx,vy);
    age = random(0,30);
  }

  boolean exist() {
    location.add(velocity);
    noStroke();
    ellipse(location.x, location.y, 10, 10);

    if (age > lifespan) {
      return false;
    }
    age++;
    return true;
  }

}


