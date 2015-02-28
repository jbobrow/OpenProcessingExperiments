
void setup() {
  size(800, 600);
  smooth();
  noStroke();
  background(#f0e8b8, 20);
}

void draw() {
  background(#f0e8b8);
  translate(mouseX-315, mouseY-313);
  //A
  fill(#ED4370);
  quad(170, 200, 190, 200, 140, 400, 120, 400);
  quad(170, 200, 190, 200, 240, 400, 220, 400);
  rect(150, 300, 50, 20);

  //+
  fill(#c2a882);
  rect(270, 300, 90, 26);
  rect(302, 268, 26, 90);
  
  //T
  fill(#93c2cf);
  rect(400, 200, 140, 20);
  rect(460, 200, 20, 200);
}
