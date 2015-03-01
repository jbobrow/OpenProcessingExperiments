
// Selfportrait

void setup() {
  size(600, 600);
  background(#6EBEE1);
  strokeWeight(5);
  smooth();
}

void draw() {
  // Right eye
  fill(#D9DE54);
  stroke(#942B89);
  arc(370, 180, 150, 200, 0, PI*1.25);
  line(316, 108, 445, 178);


  // Left eye
  stroke(#942B89);
  strokeWeight(17);
  beginShape();
  vertex(119, 64);
  vertex(287, 54);
  vertex(277, 240);
  vertex(139, 210);
  endShape(CLOSE);

  // Nose
  strokeWeight(5);
  noFill();
  stroke(#E16700);
  curveTightness(3);
  curve(250, 480, 250, 280, 350, 280, 350, 480);

  stroke(#E16700);
  curveTightness(-3);
  curve(250, 480, 250, 280, 350, 280, 350, 480);

  // Mouth
  stroke(#942B89);
  strokeWeight(10);
  point(141, 427);
  strokeWeight(7);
  point(210, 458);
  strokeWeight(12);
  point(286, 472);
  strokeWeight(21);
  point(360, 472);
  strokeWeight(8);
  point(429, 449);
  strokeWeight(6);
  point(470, 401);
}

