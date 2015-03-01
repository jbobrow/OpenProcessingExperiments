
int xPos = 25;
int yPos = 60;
int bSize = 30;

void setup() {
  noStroke();
  size(800, 600);
  background(200);

  fill(255);
  rect(80, 0, 720, 600);

  fill(255, 255, 255);
  rect(xPos, yPos, bSize, bSize);

  fill(0);
  rect(xPos, yPos+bSize, bSize, bSize);

  fill(255, 0, 0);
  rect(xPos, yPos+bSize*2, bSize, bSize);

  fill(255, 204, 0);
  rect(xPos, yPos+bSize*3, bSize, bSize);

  fill(9, 153, 72);
  rect(xPos, yPos+bSize*4, bSize, bSize);

  fill(13, 96, 178);
  rect(xPos, yPos+bSize*5, bSize, bSize);

  fill(131, 50, 167);
  rect(xPos, yPos+bSize*6, bSize, bSize);
}

void draw() {


  if (mousePressed) {
    if (mouseX > 190 && mouseX < 800 && mouseY >  20 && mouseY < 560) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }


    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(255, 255, 255);
      strokeWeight(5);
    }


    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize*2) {
      stroke(0);
      strokeWeight(5);
    }


    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2 && mouseY < yPos+bSize*3) {
      stroke(255, 0, 0);
      strokeWeight(5);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*3 && mouseY < yPos+bSize*4) {
      stroke(255, 204, 0);
      strokeWeight(5);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*4 && mouseY < yPos+bSize*5) {
      stroke(9, 153, 72);
      strokeWeight(5);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*5 && mouseY < yPos+bSize*6) {
      stroke(13, 96, 178);
      strokeWeight(5);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*6 && mouseY < yPos+bSize*7) {
      stroke(131, 50, 167);
      strokeWeight(5);
    }
  }

}

