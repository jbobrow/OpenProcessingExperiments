
int eSize = 3;

size(510, 510);
colorMode(RGB, 510);
background(255, 120, 255,300);
noStroke();

for (int y = 0; y <= 510; y += 15) {
  for (int x = 0; x <=510; x += 15) {
    fill(510-y, 250-x, y, 70);
    rect(x, y, eSize, eSize);
    ellipse(x, y, eSize, eSize);
  }
}

for (int y = 0; y <= 510; y += 15) {
  for (int x = 0; x <=510; x += 15) {
    fill(510-y, 255-y, y, 30);
    ellipse(65, 470-y, eSize, eSize);
    ellipse(20, 270-x, eSize, eSize);
    ellipse(37, 200-y, eSize, eSize);
    ellipse(45, 420-y, eSize, eSize);
    rect(73, 380-y, eSize, eSize);
    rect(85, 100-x, eSize, eSize);
  }
}
for (int x = 0; x <=width; x +=10) {
  stroke(x, 225, 255, 127);
  line(x, 0, x, height);
  line(0, 0, x, height);
  line(x, x, 0, height);
}

for (int x = 0; x <=width; x +=10) {
  stroke(x, 255, 255, 127);
  line(510,0 , x, height);
  line(450, 0, x, height);
  line(0, 450, x, 0);
  line(300, 510, x, 0);
}


