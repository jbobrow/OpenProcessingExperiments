
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);

  //eyebrow
  float ypos = map(mouseX, 0, width, 100, 50);
  float thinkness = map(mouseX, 0, width, 10, 20);
  stroke(0);
  strokeWeight(thinkness);
  line(150, ypos, 225, 100);
  line(265, 100, 340, ypos);


  //mouth
  float dia = map(mouseX, 0, width, 20, 60);
  println(dia);
  noStroke();
  fill(0);
  ellipse(width/2, 375, dia, dia);


  //left_eye
  noStroke();
  fill(0);
  ellipse(190, 150, 75, 75);

  float left_dia = map(mouseX, 0, width, 20, 40);
  println(dia);
  noStroke();
  fill(255);
  ellipse(170, 150, left_dia, left_dia); 

   //right_eye
  noStroke();
  fill(0);
  ellipse(300, 150, 75, 75);

float right_dia = map(mouseX, 0, width, 20, 40);
  println(dia);
  noStroke();
  fill(255);
  ellipse(280, 150, right_dia, right_dia); 


  //nose
  noFill();
  strokeWeight(10);
  stroke(0);
  strokeCap(SQUARE);
  beginShape();
  vertex (222, 150);
  vertex(222, 325);
  vertex(275, 325);
  endShape();
}
