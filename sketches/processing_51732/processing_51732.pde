
Mover[] movers = new Mover[10];

void setup() {
  size (400, 400);
  background(255);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(1, 0, 0);
  }
}

void draw() {
  background(255);
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  PVector air = new PVector(random(-2, 2), random(-2, 2));
  PVector gravity = new PVector(0,0.01);

  for (int i = 0; i < movers.length; i++) {

    movers[i].applyForce(air);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}


