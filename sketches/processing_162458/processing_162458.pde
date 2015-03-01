
int xPos = 10;
int yPos = 10;
int s = 30;


void setup() {
  noStroke();
  size(800, 600);
  background(155);
  fill(255);
  rect(50, 10, 740, 580);

  //red
  fill(237, 38, 36);
  rect(xPos, yPos, s, s);

  //orange
  fill(247, 147, 30);
  rect(xPos, yPos+s, s, s);

  //yellow
  fill(255, 243, 0);
  rect(xPos, yPos+2*s, s, s);

  //green
  fill(13, 177, 75);
  rect(xPos, yPos+3*s, s, s);

  //blue
  fill(0, 113, 188);
  rect(xPos, yPos+4*s, s, s);

  //navy
  fill(60, 57, 150);
  rect(xPos, yPos+5*s, s, s);

  //purple
  fill(144, 64, 152);
  rect(xPos, yPos+6*s, s, s);

  fill(0);
  rect(xPos, yPos+7*s, s, s);

 fill(255);
  rect(xPos, yPos+10*s, s, s);
}

void draw() {
  if (mousePressed) {
    if (mouseX > 50 && mouseX < 780 && mouseY > 20 && mouseY < 580) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos && mouseY < yPos+s) {
      stroke(237, 38, 36);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s && mouseY < yPos+s+s) {
      stroke(247, 147, 30);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s && mouseY < yPos+s+s+s) {
      stroke(255, 243, 0);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s && mouseY < yPos+s+s+s+s) {
      stroke(13, 177, 75);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+4*s && mouseY < yPos+5*s) {
      stroke(0, 113, 188);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+5*s && mouseY < yPos+6*s) {
      stroke(60, 57, 150);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+6*s && mouseY < yPos+7*s) {
      stroke(144, 64, 152);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+7*s && mouseY < yPos+8*s) {
      stroke(0);
      strokeWeight(5);
    }
       if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+10*s && mouseY < yPos+11*s) {
      stroke(255);
      strokeWeight(15);
       }
  }
}

