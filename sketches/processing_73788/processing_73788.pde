
void setup() {
  size(500, 500);
} 

void draw() {
  strokeWeight(4);
  smooth();

  if (millis() >= 0) {
    background(42, 151, 227);
    fill(65, 212, 75);
    leaf();
    eyes();
    tree();
    line(150, 350, 220, 360);
  }
  if (millis() >= 1000) {
    background(32, 112, 168);
    fill(212, 210, 65);
    leaf();
    eyes();
    tree();
    line(150, 350, 220, 360);
  }
  if (millis() >= 2000) {
    background(195, 136, 225);
    fill(219, 67, 37);
    leaf();
    eyes();
    tree();
    line(150, 330, 185, 350);
    line(185, 350, 220, 340);
  }
  if (millis() >= 3000) {
    background(151, 95, 154);
    fill(170, 131, 64);
    leaf();
    eyes();
    tree();
    line(150, 350, 220, 360);
  }
  if (millis() >= 4000) {
    background(73, 67, 97);
    fill(135, 115, 81);
    leaf();
    eyes();
    tree();
    line(150, 340, 185, 330);
    line(185, 330, 220, 350);
  }
  if (millis() >= 5000) {
    background(44, 40, 63);
    fill(44, 40, 63);
    rect(-50, -50, 600, 600);
    float ranx = random(-400, 500);
    float rany = random(-400, 500);
    tree();
    rotate(.75);
    translate(220, -150);
    fill(135, 115, 81);
    line(160, 330, ranx, rany);
    leaf();
    fill(200, 200, 255);
    ellipse(230, 310, 10, 30);
    eyes();
    line(150, 340, 185, 330);
    line(185, 330, 220, 350);
    fill(200, 200, 255);
  }
}


void leaf() {
  smooth();
  beginShape();
  vertex(220, 200);
  vertex(220, 210);
  vertex(210, 230);
  curveVertex(210, 230);
  curveVertex(200, 230);
  curveVertex(130, 240);
  curveVertex(100, 320);
  curveVertex(120, 400);
  curveVertex(110, 430);
  curveVertex(80, 440); 
  curveVertex(120, 445);
  curveVertex(200, 420);
  curveVertex(250, 380);
  curveVertex(270, 330);
  curveVertex(260, 280);
  curveVertex(225, 240);
  curveVertex(225, 240);
  vertex(230, 215);
  endShape(CLOSE);
}

void tree() {
  smooth();
  fill(127, 75, 37);
  quad(0, 100, 500, 150, 500, 240, 0, 200);
}

void eyes() {
  fill(0);
  ellipse(150, 280, 15, 15);
  ellipse(230, 300, 15, 15);
}
