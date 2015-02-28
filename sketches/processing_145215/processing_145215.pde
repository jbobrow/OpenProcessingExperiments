
Entity entity = new Entity();
float bgCol = 255;

void setup() {
  size(500, 500);
  noStroke();
  fill(0);
}

void draw() {
  if (entity.distanceFromMouse <=2) background(255, 0, 0);
  else background(bgCol);
  entity.getNewPos();
  entity.show();
  bgCol = map(entity.distanceFromMouse, 0, 500, 0, 255);
}


class Entity {
  PVector location = new PVector(250, 250);
  PVector velocity = new PVector(0, 0);
  PVector acceleration;
  float size;
  float maxVel;
  float distanceFromMouse;

  void getNewPos() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);

    dir.normalize();
    acceleration = dir;
    velocity.add(dir);

    float maxDistance = sqrt(sq(width)+sq(height));
    velocity.limit(map(distanceFromMouse, 0, maxDistance, 3, 0.1));

    location.add(velocity);
    distanceFromMouse = dist(location.x, location.y, mouseX, mouseY);
    size = map(distanceFromMouse, 0, maxDistance, 50, 5);
  }

  void show() {
    ellipse(location.x, location.y, size, size);
  }
}

