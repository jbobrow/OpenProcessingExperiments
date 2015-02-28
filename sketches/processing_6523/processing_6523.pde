
import org.jbox2d.p5.*;

Physics physics;

void setup() {
  size(480, 320);
  frameRate(60);
  physics = new Physics(this, width, height);
  physics.setDensity(1.0);
}

void draw() {
  background(204);
}

void mousePressed() {
  physics.createCircle(mouseX, mouseY, 10);
}

