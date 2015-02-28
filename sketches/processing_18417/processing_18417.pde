
void setup () {
size(250, 250);
background (#A1EA53);
}
void draw () {
  noStroke();
  smooth();
  fill(#32CEB0);
  rect(0, 0, 50, 250);
  rect(200, 0, 50, 250);
}
void mouseClicked() {
  stroke(#272934);
  strokeWeight(random (0, 8));
  line (50, random (0, 250), 200, random (0, 250));
  stroke(random (0, 50));
  line (50, random (0, 250), 200, random (0, 250));
  stroke(#F0F29F, 120);
  line (50, random (0, 250), 200, random (0, 250));
}

