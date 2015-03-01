
ArrayList<Particle> pts;
boolean onPressed, showInstruction;

void setup() {
  size(720, 720);
  smooth();  
  frameRate(50);
  colorMode(HSB);
  rectMode(CENTER);

  pts = new ArrayList<Particle>();

  background(0);
}

void draw() {

  if (onPressed) {
    for (int i=0;i<10;i++) {
      Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
      pts.add(newP);
    }
  }

  for (int i=0; i<pts.size(); i++) {
    Particle p = pts.get(i);
    p.update();
    p.display();
  }

  for (int i=pts.size()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }
  }
}

void mousePressed() {
  onPressed = true;
  if (showInstruction) {
    background(255);
    showInstruction = false;
  }
}

void mouseReleased() {
  onPressed = false;
}

void keyPressed() {
  if (key == 'c') {
    for (int i=pts.size()-1; i>-1; i--) {
      Particle p = pts.get(i);
      pts.remove(i);
    }
    background(255);
  }
}

class Particle {
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  color c;

  Particle(float x, float y, float xOffset, float yOffset) {
    loc = new PVector(x, y);

    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));

    acc = new PVector(0, 0);
    lifeSpan = int(random(10, 100));
    decay = random(2, 3);
    c = color(mouseX, random(255), random(350));
    weightRange = random(30, 50);

    this.xOffset = xOffset;
    this.yOffset = yOffset;
    if (mouseX>255) {
      c=color(mouseX-mouseY, random(255), random(350));
    }
  }

  void update() {
    if (passedLife>=lifeSpan) {
      dead = true;
    }
    else {
      passedLife++;
    }

    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;

    acc.set(0, 0);


    vel.add(acc);
    vel.mult(decay);
    vel.limit(30);
    loc.add(vel);
  }

  void display() {
    strokeWeight(weight+1.5);
    stroke(0, alpha);
    point(loc.x, loc.y);

    strokeWeight(weight);
    stroke(c);
    point(loc.x, loc.y);
  }
}






