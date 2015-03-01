
void setup() {
  size(600, 600);
  background(1);
  noFill();
}

void draw() {
  
  stroke(61,216,124);
  rect(535,60,535,60);
  strokeWeight(random(10, 25));
  stroke(random(255), random(255), random(255));
  float rainbow_size = random(400, 480);
  ellipse(150, 350, rainbow_size, rainbow_size);
  float rainbow_size = random(200, 300);
  ellipse(150, 350, rainbow_size, rainbow_size);
   float rainbow_size = random(600, 600);
  ellipse(150, 350, rainbow_size, rainbow_size);
}



