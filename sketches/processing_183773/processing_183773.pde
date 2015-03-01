
void setup () {
  size (400,400);
 background (#7EE3F0);
noFill(); 
}

void draw() {
  strokeWeight(random(3,10));
  stroke (random(200,255), random(200,255), random (200,255));
  float rainbow_size = random(200,400);
  ellipse(200,400,rainbow_size,rainbow_size);
}
