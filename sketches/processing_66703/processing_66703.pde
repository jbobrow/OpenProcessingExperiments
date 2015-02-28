
PVector l;
PVector v;
PVector g;
int r = 10;
int b = 0;

void setup() {
  size(800, 800);
  smooth();
  float a = random(2*r, width-2*r);
  l = new PVector(a,height-a);
  v = new PVector(3, 3);
}

void printcollision() {
  println("Collision happened " + b + " times.");
}

void draw() {
  background (33);
  l.add(v);
  if (l.x >= width-r) {
    v.x = v.x * -1;
    l.x = width-r;
    b++;
    printcollision();
  }
  if (l.x <= r) {
    v.x = v.x * -1;
    l.x = r;
    b++;
    printcollision();
  }
  if (l.y >= height-r) {
    v.y = v.y * -1;
    l.y = height-r;
    b++;
    printcollision();
  }
  if (l.y <= r) {
    v.y = v.y * -1;
    l.y = r;
    b++;
    printcollision();
  }
fill(255);
textAlign(CENTER);
text("Collision happened " + b + " times.",width/2,height/2);
fill(255);
rectMode(CENTER);
ellipse(l.x, l.y, 2*r, 2*r);
}

