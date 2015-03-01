
//2014.09.17
/*Create a drawing board with at least 8 buttons.
 Design an intuitive interface for the users,
 and before you start think how pleasurable the activity of drawing can be,
 and what kind of results you expect from the users.*/


int xPos = 75;
int yPos = 75;
int bSize = 30;

void setup() {
  size(800, 600);
  background(211,211,211);
stroke(153);


  //drawing board
  fill(255,255,255);
  rect(200, 10, 590, 590);
noStroke();

  //buttons
  fill(237, 28, 36);
  rect(xPos, yPos, bSize, bSize);
  fill(242, 101,34);
  rect(xPos, yPos+bSize, bSize, bSize);
  fill(247,148,29);
  rect(xPos, yPos+bSize*2, bSize, bSize);
  fill(255,242,0);
  rect(xPos, yPos+bSize*3, bSize, bSize);
  fill(141,198,63);
  rect(xPos, yPos+bSize*4, bSize, bSize);
  fill(57,181,74);
  rect(xPos, yPos+bSize*5, bSize, bSize);
  fill(0,166,81);
  rect(xPos, yPos+bSize*6, bSize, bSize);
  fill(0,169,157);
  rect(xPos, yPos+bSize*7, bSize, bSize);
  fill(0,191,243);
  rect(xPos, yPos+bSize*8, bSize, bSize);
  fill(68,140,203);
  rect(xPos, yPos+bSize*9, bSize, bSize);
  fill(0,48,166);
  rect(xPos, yPos+bSize*10, bSize, bSize);
    fill(255,255,255);
  rect(xPos, yPos+bSize*13, bSize, bSize);
}

void draw() {

  if (mousePressed) {

    //brush
    if (790 > pmouseX && 790 > mouseX && pmouseX > 210 && mouseX > 210 &&
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


    //red,
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(237,28,36);
      strokeWeight(10);
    }
    //orange
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize+bSize) {
      stroke(242, 101,34);
      strokeWeight(10);
    }

    //orange2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY < yPos+bSize+bSize+bSize) {
      stroke(247,148,29);
      strokeWeight(10);
    }
    //yellow
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize) {
      stroke(255,242,0);
      strokeWeight(10);
    }
    //green1
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(141,198,63);
      strokeWeight(10);
    }
    //green2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(57,181,74);
      strokeWeight(10);
    }
    //grey -  you can use this as an eraser.
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(0,166,81);
      strokeWeight(10);
    }
     //blue1
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(0,169,157);
      strokeWeight(10);
    }
       //blue2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(0,161,243);
      strokeWeight(10);
    }
           //blue2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(68,140,203);
      strokeWeight(10);
    }
        //blue2
          if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(0,48,166);
      strokeWeight(10);
    }
      //blue2
          if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(255,255,255);
      strokeWeight(30);
    }
  }
}
