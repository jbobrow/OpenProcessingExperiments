
//2014.09.17
/*Create a drawing board with at least 8 buttons. 
 Design an intuitive interface for the users, 
 and before you start think how pleasurable the activity of drawing can be, 
 and what kind of results you expect from the users.*/


int xPos = 400;
int yPos = 540;
int bSize = 30;

void setup() {
  stroke(200);
  strokeWeight(10);
  size(800, 600);
  background(0, 112, 135);

  //drawing board
  fill(255);
  rect(0, 0, 800, 500);

  //buttons 
  stroke(255);
  strokeWeight(2);
  fill(255);
  rect(xPos-bSize*2, yPos, bSize, bSize);
  fill(212, 244, 250);
  rect(xPos, yPos, bSize, bSize);
  fill(178, 235, 244);
  rect(xPos+bSize, yPos, bSize, bSize);
  fill(92, 209, 229);
  rect(xPos+bSize*2, yPos, bSize, bSize);
  fill(61, 183, 204);
  rect(xPos+bSize*3, yPos, bSize, bSize);
  fill(0, 130, 153);
  rect(xPos+bSize*4, yPos, bSize, bSize);
  fill(0, 87, 102);
  rect(xPos+bSize*5, yPos, bSize, bSize);
  fill(0, 51, 66);
  rect(xPos+bSize*6, yPos, bSize, bSize);
  fill(255,178,217);
  rect(xPos+bSize*7, yPos, bSize, bSize);
  fill(0);
  rect(xPos+bSize*9, yPos, bSize, bSize);
  stroke(0);
  strokeWeight(5);
}

void draw() {

  if (mousePressed) {

    //brush 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 10 && mouseX > 10 && 
      490 > pmouseY && 490 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


   if ( mouseX > xPos-bSize*2 && mouseX < xPos-bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(255);
      strokeWeight(5);
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(212, 244, 250);
      strokeWeight(5);
    }
    //yellow
    if ( mouseX > xPos+bSize && mouseX < xPos+bSize+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(178, 235, 244);
      strokeWeight(5);
    }

    //grey -  you can use this as an eraser.
    if ( mouseX > xPos+bSize+bSize && mouseX < xPos+bSize+bSize+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(92, 209, 229);
      strokeWeight(5);
    }

    if ( mouseX > xPos+bSize*3 && mouseX < xPos+bSize*4 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(61, 183, 204);
      strokeWeight(5);
    }
    if ( mouseX > xPos+bSize*4 && mouseX < xPos+bSize*5 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(0, 130, 153);
      strokeWeight(5);
    }
    if ( mouseX > xPos+bSize*5 && mouseX < xPos+bSize*6 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(0, 87, 102);
      strokeWeight(5);
    }
    if ( mouseX > xPos+bSize*6 && mouseX < xPos+bSize*7 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(0, 51, 66);
      strokeWeight(5);
    }
    if ( mouseX > xPos+bSize*7 && mouseX < xPos+bSize*8 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(255,178,217);
      strokeWeight(5);
    }
      if ( mouseX > xPos+bSize*9 && mouseX < xPos+bSize*20 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(0);
      strokeWeight(5);
    }
  }
}

