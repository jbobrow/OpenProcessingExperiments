
int count = 0;

void setup() {
  size(600, 600);
  smooth(); 
  background(0);
  frameRate(20);
}

void draw() {
  if (mousePressed) {
    for (int i = 0; i < 100; i++) {
      float x = random(width);
      float y = random(height);
      stroke(41, random(255), 0);
      fill(random(255), random(255), random(255));
      line(x, y, x+random(50), y+random(50)); 
      count++;
    }
  }
  println("Lineas = "+ count);

  if (keyPressed) {
    if (key == 'c') {
      count = 0;
      background(0);
    }
  }

  if (count == 100000) {
    background(0);
    count=0;
  }
}

