
import fisica.*;

FWorld world;

int prevX=0;
int prevY=0;

int frame=0;

void setup() {
  size(900,506);
  colorMode(HSB, 100);
  background(0);
  smooth();

  Fisica.init(this);
  world = new FWorld();
  world.setEdges();

}

void draw() {
  world.step();
  world.draw();

  if (frame < 700) {
    if (frame%30 == 0) {
      addCircle(30, height-30, int(random(100,500)), int(random(-500,-1500)));
    }
    frame++;
  }
}

void mousePressed() {
  prevX = mouseX;
  prevY = mouseY;
}

void mouseReleased() {
  // Only make a new one if we are not dragging the current
  if (world.getBody(mouseX, mouseY) == null) {
    // Set velocity based on mousePressed position
    addCircle(mouseX, mouseY, (mouseX-prevX)*10, (mouseY-prevY)*10);
  }
}

void addCircle(int x, int y, int velX, int velY) {
  FCircle myCircle = new FCircle(30);
  myCircle.setPosition(x, y);
  myCircle.setRotation(random(TWO_PI));
  myCircle.setVelocity(velX, velY);
  color c = color(int(random(0,100)), 50, 50);
  myCircle.setFill(red(c), green(c), blue(c));
  myCircle.setNoStroke(); // comment this line to see how the physics engine works
  world.add(myCircle);
}


