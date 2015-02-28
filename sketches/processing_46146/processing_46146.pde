


void setup() {
  size(1080, 720);
}

void draw(){
  strokeWeight(3);
  fill(173, 90, 255);
  ellipse(315, 280, 400, 300);
  fill(216, 199, 169);
  rect(230, 300, 150, 170);
  fill(random(0,255), random(0,255), random (0, 255), 230);
  rect(220, 340, 50, 30);
  rect(320, 340, 50, 30);
  fill(random(0,255), random(0,255), random (0, 255), 140);
  ellipse(mouseX, mouseY, 100, 100);
}

