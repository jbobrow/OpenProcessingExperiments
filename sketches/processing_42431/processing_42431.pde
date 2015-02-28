
int oldMouseX, oldMouseY;
color myPenStroke;
int myPenWeight;

void setup() {
  size(800, 800);
  smooth();
  oldMouseX = 0;
  oldMouseY = 0;
  myPenStroke = color(0, 0, 0);
  myPenWeight = 1;
  background(255);
}

void draw() {
  strokeWeight(myPenWeight);
  stroke(myPenStroke);
  if (mousePressed) {
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line(mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  //red button
  fill(255, 0,0);
  stroke(0);
  strokeWeight(1);
  ellipse(20, 20, 40, 40);
  if(mousePressed && dist(20, 20, mouseX, mouseY) < 20) {
    myPenStroke = color(255, 0, 0);
  }
  //thin line button
  stroke(0);
  strokeWeight(1);
  line(100, 0, 100, 40);
  if(mousePressed && mouseX > 90 && mouseX <110 && mouseY > 0 && mouseY < 40) {
    if(myPenWeight > 0) {
      myPenWeight --;
    }
  }
  
  //thick line button
  stroke(0);
  strokeWeight(5);
  line(120, 0, 120, 40);
  if(mousePressed && mouseX > 110 && mouseX <130 && mouseY > 0 && mouseY < 40) {
    myPenWeight ++;
  }
  //black button
  fill(0, 0,0);
  strokeWeight(1);
  stroke(0);
  ellipse(60, 20, 40, 40);
  if(mousePressed && dist(60, 20, mouseX, mouseY) < 20) {
    myPenStroke = color(0, 0, 0);
  }
  
  //clear screen
  fill(255);
  strokeWeight(1);
  stroke(0);
  rect(10, 60, 40, 40);
  if(mousePressed && mouseX > 10 && mouseX < 50 && mouseY > 60 && mouseY< 100) {
    background(255);
    myPenWeight = 1;
  }
  
  
}


