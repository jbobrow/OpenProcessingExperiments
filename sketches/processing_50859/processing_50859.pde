
void setup() {
  size(200, 200);
}

void draw() {
  smooth();
  background(255);
  fill(0);

  /*leftarm*/
  rect(40, 40, 12, 27);
  /*rightarm*/
  rect(115, 48, 12, 25);
  /*body*/
  beginShape();
  vertex(40, 55);
  vertex(60, 55);
  vertex(60, 45);
  vertex(65, 40);
  vertex(102, 40);
  vertex(107, 44);
  vertex(107, 61);
  vertex(127, 61);
  vertex(127, 73);
  vertex(95, 73);
  vertex(95, 52);
  vertex(72, 52);
  vertex(72, 67);
  vertex(40, 67);
  endShape();

  ellipseMode(CENTER);
  /*lefteye*/  ellipse(72, 30, 16, 16);
  /*righteye*/  ellipse(95, 30, 16, 16);
  /*mouth*/
  fill(mouseY, mouseX, mouseX);
  rect(75, mouseY, 17, 9);
  float mx = constrain(mouseX, 90, 102);
  float my = constrain(mouseY, 100, 120);


  /*leftclaw*/
  noStroke();
  beginShape();
  vertex(40, 38);
  vertex(40, 25);
  vertex(46, 31);
  vertex(52, 25);
  vertex(52, 38);
  endShape();

  /*leftclaw*/  triangle(115, 46, 122, 35, 127, 46);
}


