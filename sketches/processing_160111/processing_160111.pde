
void setup() {
  size(500,500);
  background(255);
}

void draw() {
  stroke(random(200),random(400),random(255),75);
  strokeWeight(150);
  line(random(width),0,random(width),500);
}

