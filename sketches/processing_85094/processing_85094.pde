
void setup() {
  size(300, 300);
  background(20, 40, 200);
  smooth();
  frameRate(32);
}

void draw() { 
  //draw.clear();

  background(20, 40, 200);
  noStroke();
  fill(60, 222, 240);
  rect(0, 0, 300, 280);
  fill(255, 0, 0);
  rect(100+(mouseX-150), 220, 100, 50);
  arc(100+(mouseX-150), 270, 120, 100, PI, PI*3/2);
  arc(200+(mouseX-150), 270, 80, 100, PI*3/2, 2*PI);
  arc(150+(mouseX-150), 230, 100, 100, PI, 2*PI);
  fill(0);
  arc(90+(mouseX-150), 270, 30, 30, 0, PI);
  arc(200+(mouseX-150), 270, 30, 30, 0, PI);
  fill(255);
  rect(127+(mouseX-150), 195, 20, 25);
  rect(153+(mouseX-150), 195, 20, 25);
  arc(122+(mouseX-150), 220, 30, 45, PI, PI*3/2);
  arc(178+(mouseX-150), 220, 30, 45, PI*3/2, 2*PI);
  fill(255+(mouseX-150), 255, 51);
  arc(62+(mouseX-150), 238, 20, 20, PI*7/8, PI*13/8);
}
