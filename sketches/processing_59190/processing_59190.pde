
void setup() {
  size(450, 450);
  background(0);
  smooth();
}

void draw() {

  //HEAD
  noStroke();
  fill(255);
  ellipse(225, 225, 225, 225);

  //Mouth  
  stroke(7,222,184);
  strokeWeight(4);
  fill(12, 245, 204);
  ellipse(190, 280, 50, 50);

  //Hat
  stroke(0);
  strokeWeight(4);
  fill(12, 245, 204);
  ellipse(225, 140, 200, 30);

  //Hat 02
  noStroke();
  fill(12, 245, 204);
  ellipse(225, 120, 150, 60);

  //Eye left
  stroke(7,222,184);
  strokeWeight(4);
  fill(12, 245, 204);
  ellipse(150, 200, 30, 30);

  //Eye left Iris
  noStroke();
  fill(255);
  ellipse(140, 210, 20, 20);

  //Eye right
  stroke(7,222,184);
  strokeWeight(4);
  fill(12, 245, 204);
  ellipse(250, 200, 30, 30);

  //Eye right Iris
  noStroke();
  fill(255);
  ellipse(240, 210, 20, 20);
}
