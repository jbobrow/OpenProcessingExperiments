
void setup() {
  size(500, 500);
  background(0);
}
 
void draw() {
 
stroke(random(255), random(255), random(255));
strokeWeight(3);
fill(random(255), random(255), random(255), random(10));
ellipse(250, 250, 100, 100);
fill(random(255), random(255), random(255), random(10));
 
}

