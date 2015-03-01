

void setup() {
  size(800, 600);
  rectMode(CENTER);
}

void draw() {
  float radius = random(200);
  fill(random(255), random(255), random(255), 147);
  if(random(10) > 5) {
    rect(random(width), random(height), radius, radius);
  } else {
    ellipse(random(width), random(height), radius, radius);
  }
}




