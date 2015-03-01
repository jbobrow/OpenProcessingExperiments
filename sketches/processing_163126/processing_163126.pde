
//mountain 
//by changing the radians you are changing the visual
import processing.pdf.*;

boolean record;

void setup() {
  size(1190, 841, P3D);
} 

void draw() {
  if (record) {
    beginRaw(PDF, "print########.pdf");
  }
  background(0);
  fill(0);
  noStroke();
  rect(0, 0, width, height);

  pushMatrix();
  for (int i = 0; i<400; i++) {
    float rotation = map(i= i+1, 0, 0, 0, 45);
    rotateY(radians(22));
    rotateX(radians(8));
    mountain();
  }
  popMatrix();

  if (record) {
    endRaw();
    record = false;
  }
}

void mountain() {
  stroke(255);
  strokeWeight(0.5);
  noFill();
  beginShape();
  vertex(100, 550);
  vertex(200, 350);
  vertex(250, 450);
  vertex(350, 230);
  vertex(400, 500);
  vertex(500, 450);
  vertex(550, 300);
  vertex(600, 430);
  vertex(700, 320);
  vertex(850, 500);
  vertex(900, 650);
  vertex(1000, 540);
  vertex(1100, 200);
  endShape();
}

void keyPressed() {
  if (key == 'r') 
  {
    record = true;
  }
}

