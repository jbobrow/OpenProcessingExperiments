
void setup() {
  size(1200, 900);
  smooth();
}

void draw() {
  background(237, 237, 237);

  int dog = 600;
  while (dog > 0) {
    noFill();
    strokeWeight(2);
    stroke(255, 255, 255);
    ellipse(width/2, height/2, dog, dog);
    dog = dog - 8;
  }

  int cat = 300;
  while (cat > 0) {
    noFill();
    stroke(0, 255, 240);
    ellipse(width/2, height/2+150, cat, cat);
    cat = cat - 6;
  }
  int ugly = 300;
  while (ugly > 0) {
    noFill();
    stroke(255, 0, 243);
    ellipse(width/2, height/2-150, ugly, ugly);
    ugly = ugly - 6;
  }
  int p = 300;
  while (p > 0) {
    noFill();
    stroke(254, 255, 0);
    ellipse(width/2, height/2, p, p);
    p = p - 6; // or i++
  }
}
