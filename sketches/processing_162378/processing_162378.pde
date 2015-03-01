

int xPos = 30;
int yPos = 30;
int bSize = 30;



void setup() {
  size(800, 600);
  background(0);

  stroke(255);

  fill(255);
  rect(90, 30, 680, 540);

  fill(255, 0, 0);
  rect(xPos, yPos, bSize, bSize);

  fill(255, 255, 0);
  rect(xPos, yPos+bSize*2, bSize, bSize);

  fill(0, 255, 0);
  rect(xPos, yPos+bSize*4, bSize, bSize);

  fill(0, 255, 255);
  rect(xPos, yPos+bSize*6, bSize, bSize);

  fill(0, 0, 255);
  rect(xPos, yPos+bSize*8, bSize, bSize);

  fill(255, 0, 255);
  rect(xPos, yPos+bSize*10, bSize, bSize);

  fill(255);
  rect(xPos, yPos+bSize*12, bSize, bSize);

  fill(0);
  rect(xPos, yPos+bSize*14, bSize, bSize);
}



void draw() {


  if (mousePressed) {
    if (mouseX < 750 && mouseX > 110 && mouseY < 560 && mouseY > 20 == true) {
      ellipse(mouseX, mouseY, 30, 30);
      rect(mouseX, mouseY, 30, 30);
    }


    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize ) {
      fill(255, 0, 0);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2 && mouseY < yPos+bSize*3 ) {
      fill(255, 255, 0);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*4 && mouseY < yPos+bSize*5 ) {
      fill(0, 255, 0);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*6 && mouseY < yPos+bSize*7 ) {
      fill(0, 255, 255);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*8 && mouseY < yPos+bSize*9 ) {
      fill(0, 0, 255);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*10 && mouseY < yPos+bSize*11 ) {
      fill(255, 0, 255);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*12 && mouseY < yPos+bSize*13 ) {
      fill(255);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*14 && mouseY < yPos+bSize*15 ) {
      fill(0);
    }
  }
}

