
int xPos = 31;
int yPos = 50;
int S = 30;


void setup() {
  noStroke();
  size(800, 600);
  background(242, 242, 242);
  fill(255);
  rect(90, 20, 680, 560);



  fill(25, 55, 44);
  rect(xPos, yPos, S, S);

  fill(50, 115, 68);
  rect(xPos, yPos+S, S, S);

  fill(67, 126, 76);
  rect(xPos, yPos+S+S, S, S);

  fill(134, 153, 86);
  rect(xPos, yPos+S+S+S, S, S);

  fill(176, 143, 66);
  rect(xPos, yPos+S+S+S+S, S, S);

  fill(180, 104, 57);
  rect(xPos, yPos+S+S+S+S+S, S, S);

  fill(164, 57, 65);
  rect(xPos, yPos+S+S+S+S+S+S, S, S);

  fill(156, 44, 82);
  rect(xPos, yPos+S+S+S+S+S+S+S, S, S);

  fill(187, 66, 107);
  rect(xPos, yPos+S+S+S+S+S+S+S+S, S, S);

  fill(138, 47, 92);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S, S, S);

  fill(109, 65, 109);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(65, 50, 100);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(41, 65, 110);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(86, 144, 165);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(46, 132, 157);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S, S, S);





  stroke(1);
  fill(255);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S, S, S);
}





void draw() {
  if (mousePressed) {
    if (mouseX > 100 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
      line (pmouseX, pmouseY, mouseX, mouseY);
      float Random = dist(pmouseX, pmouseY, mouseX, mouseY);
      strokeWeight(Random);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos && mouseY < yPos+S) {
      stroke(25, 55, 44);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S && mouseY < yPos+S+S) {
      stroke(50, 115, 68);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S && mouseY < yPos+S+S+S) {
      stroke(67, 126, 76);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S && mouseY < yPos+S+S+S+S) {
      stroke(134, 153, 86);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S && mouseY < yPos+S+S+S+S+S) {
      stroke(176, 143, 66);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S) {
      stroke(180, 104, 57);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S) {
      stroke(164, 57, 65);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S) {
      stroke(156, 44, 82);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S) {
      stroke(187, 66, 107);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S) {
      stroke(138, 47, 92);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(109, 65, 109);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(65, 50, 100);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(41, 65, 110);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(86, 144, 165);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(46, 132, 157);
      strokeWeight(1);
    }



    if (mouseX < xPos+S && mouseX >xPos && mouseY <yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S && mouseY >yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(255);
    }
  }
}
