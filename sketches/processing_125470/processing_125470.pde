
//size(displayWidth, displayHeight);
size(400,400);
background(255);
rectMode(CENTER);

smooth();
fill(120, 40);
stroke(0, 80);
strokeWeight(0.5);

for (int i = -100; i < 900; i++) { // i++ | i = i + 1
  pushMatrix();
  for (int j = 0; j < 900; j++) {
    float w = (40-i) * 0.04 + 10;
    rect(0, 0, i, w);
    rotate(radians(1));
    translate(0, 15);
  }

  popMatrix();
  translate(150, 0);
}

