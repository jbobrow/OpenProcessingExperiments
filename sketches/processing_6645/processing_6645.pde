
import org.jbox2d.p5.*;

Physics physics;

void setup() {
  size(480, 320);
  frameRate(60);
  physics = new Physics(this, width, height);
  physics.setDensity(1.0); //重さ(密度)
  physics.setRestitution(0.2); //反発係数
  physics.setFriction(0.0); //摩擦係数
}

void draw() {
  background(204);
}

void mousePressed() {
  float d = 5;
  physics.createRect(mouseX - d * 2, mouseY - d, mouseX + d * 2, mouseY + d);
}

