
float gray = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(gray);
}

void mousePressed() {
  gray += 20;
  ellipse(80, 80, 80, 80);
  fill(20, 30, 255);
  stroke(200, 20, 255);
  strokeWeight(6);
}

void mouseReleased() {
  ellipse(80, 80, 80, 80);
  fill(30, 255, 20); 
  stroke(222, 255, 10);
  strokeWeight(4);
}



