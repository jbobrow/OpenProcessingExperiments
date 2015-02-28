
int lastbgc;

void setup() {
  size(500, 500);
  frameRate(1);
  background(255);
  lastbgc = int( map(hour(), 1, 24, 0, 255) );
}

void draw() {
 
    if (second() < 59) {
    smooth();
    noFill();
    stroke(2, 100);
    strokeWeight(10);
    float i =random(10, 400);
    ellipse(random(width), random(height), i, i);
    println(second());
  }
  if (second() >= 59) {
    background(lastbgc);
  }
}

                
                
