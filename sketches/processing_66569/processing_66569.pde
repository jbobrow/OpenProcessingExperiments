
int mX = 0;
int mY = 0;
boolean state = false;

void setup() {
  size(400, 400);
}

void draw() {

  background(255);
  strokeWeight(3);
  stroke(255, 0, 0);
  fill(255, 200, 0);




  if (keyPressed == true) {

    beginShape();
    curveVertex(0, 0);
    curveVertex(0, 0);
    curveVertex(mX, mY);
    curveVertex(250, 150);
    curveVertex(300, 300);
    curveVertex(400, 400);
    curveVertex(400, 400);
    vertex(400, 0);
    endShape();
    println("Key Pressed");
  } 
  else {
    mX = mouseX;
    mY = mouseY;

    beginShape();
    curveVertex(0, 0);
    curveVertex(0, 0);
    curveVertex(mouseX, mouseY);
    curveVertex(250, 150);
    curveVertex(300, 300);
    curveVertex(400, 400);
    curveVertex(400, 400);
    vertex(400, 0);
    endShape();
  }
}


