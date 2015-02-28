
float angle = 0.0;
float speed = 0.05;
float radius = 100.0;
float x;
float y; 

void setup(){
  size(500, 500);
  smooth();
  frameRate(20);
  noStroke();
}

void draw() {
  fill(0,50);
  noStroke();
  rect(0, 0, width, height);
  babey(0, 0);
  //babey(300, 0);
  //babey(300, 300);
  //babey(0, 300);
}

void babey(int i, int k) {
  angle += speed;
  float x = 250 + (cos(angle) * radius); 
  float y = 250 + (sin(angle) * radius);
  noFill();
  strokeWeight(2);
  stroke(random(255));
  ellipse(x + i, y + k, 20, 20);
}
