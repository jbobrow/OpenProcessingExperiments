
import controlP5.*;
objectsCollection objects;
int clickTolerance = 5;

void setup() {
  size(400,400); smooth();
  objects = new objectsCollection();
  objects.spawnPoint(width/2,height/2-50); pointObject p1 = objects.latestPoint();
  objects.spawnPoint(width/2-50,height/2+50); pointObject p2 = objects.latestPoint();
  objects.spawnPoint(width/2+50,height/2+50); pointObject p3 = objects.latestPoint();
  objects.spawnTriangle(p1,p2,p3);
}

void draw() {
  background(255);
  objects.display();
}

void mousePressed() {
  objects.pressedMouse();
}

void mouseDragged() {
  objects.draggedMouse();
}

void mouseReleased() {
  objects.releasedMouse();
}

