
PFont myFont;


void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(15, 40, 90);
  myFont = createFont("Helvetica", 18, false);
}

void draw() {


  beginShape();
  noFill();

  fill(255, 255, 0);
  ellipse (width/2, height/2, 200, 200);
  fill(255);
  noStroke();
  ellipse (150, 200, 50, 75);
  ellipse (250, 200, 50, 75);
  float leftEyePos = map(mouseX, 0, width, 135, 165);
  float rightEyePos = map(mouseX, 0, width, 235, 265);

  fill(0);
  ellipse(leftEyePos, height/2, 20, 20);
  ellipse(rightEyePos, height/2, 20, 20);
  float lidPos = map(mouseY, 0, height, 20, 100);
  //println(lidPos);
  fill(255, 255, 0);
  rect(125, 160, 155, lidPos);

  stroke(0);
  noFill();
  strokeWeight(3);
  curveVertex(200, 200); //C1
  curveVertex(200, 200); //V2
  curveVertex(180, 250); //V6
  curveVertex(220, 250); //V7
  curveVertex(220, 250); //C2
  endShape();
  noStroke();

  textFont (myFont);
  text("I'm", 60, 90);
  text("Tired", 75, 110);
}

void mousePressed() {
  background(255, 255, 200);
}
void mouseReleased() {
  background(15, 40, 90);
}


