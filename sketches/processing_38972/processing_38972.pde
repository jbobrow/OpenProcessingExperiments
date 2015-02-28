
void setup() {
  size(300, 300);
  background(0);
  noFill();
}

void draw() {
  strokeWeight(random(3, 10));
  stroke(random(100, 255), random(100, 255), random(100, 255));
  float rainbow_size = random(200, 270);
  ellipse(150, 350, rainbow_size, rainbow_size);
  
  strokeWeight(random(3, 10));
  stroke(random(100, 255), random(100, 255), random(100, 255));
  float rainbow_size2 = random(100, 350);
  ellipse(150, 100, rainbow_size2, rainbow_size2);
  
  strokeWeight(random(3, 10));
  stroke(random(100, 255), random(255), random(255));
  float rainbow_size3 = random(200, 270);
  ellipse(200, 50, rainbow_size3, rainbow_size3);
  
  strokeWeight(random(3, 10));
  stroke(random(255), random(255), random(255));
  float rainbow_size4 = random(200, 270);
  ellipse(50, 250, rainbow_size4, rainbow_size4);
}

