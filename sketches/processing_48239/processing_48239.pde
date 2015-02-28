
int numRocks = 4;
Ship s;
PVector[] stars = new PVector[100];
ArrayList<SpaceObject> spaceObjects = new ArrayList<SpaceObject>();

void setup() {
  size(800, 600);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new PVector(random(width), random(height));
  }
  for (int i = 0; i < numRocks; i++) {
    spaceObjects.add(new Asteriod(random(-50, 50), random(-50, 50), 4));
  }
  s = new Ship();
  smooth();
}

void draw() {
  drawBackground();
  for (int i = 0; i < spaceObjects.size(); i++) {
    SpaceObject spaceObj = (SpaceObject) spaceObjects.get(i);
    spaceObj.display();
    spaceObj.move(spaceObjects);
  }

  s.move();
  s.display();
  if (s.fire)s.fire();

}

void keyPressed() {
  if (key == 'a' || key == 'A') s.left = true;
  if (key == 'd' || key == 'D') s.right = true;
  if (key == 'w' || key == 'W') s.forward = true;
  if (key == 's' || key == 'S') s.backward =true;
  if (key == ' ') {
    s.fire = true;
    s.fireCounter = 10;
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') s.left = false;
  if (key == 'd' || key == 'D') s.right = false;
  if (key == 'w' || key == 'W') s.forward = false;
  if (key == 's' || key == 'S') s.backward =false;
  if (key == ' ') s.fire = false;
}

void drawBackground() {
  background(0);
  stroke(255);
  for (int i = 0; i < stars.length; i++) {
    point(stars[i].x, stars[i].y);
    stars[i].x -= .2;
    if (stars[i].x <0) stars[i].x += width;
  }
}





