
int xPos = 50;
int yPos = 100;
int bSize = 40;

void setup() {
  size(800, 600);
  background(249, 205, 173);

  //drawing board
  stroke(255);
  strokeWeight(2);

  fill(255);
  rect(150, 0, 700, 600);

  //1
  fill(141, 238, 238);
  rect(xPos, yPos, bSize, bSize);
//2
  fill(121, 205, 205);
  rect(xPos, yPos+bSize, bSize, bSize);
//3
  fill(82, 139, 139);
  rect(xPos, yPos+bSize*2, bSize, bSize);
//4
  fill(127, 255, 212);
  rect(xPos, yPos+bSize*3, bSize, bSize);
//5
  fill(118, 238, 198);
  rect(xPos, yPos+bSize*4, bSize, bSize);
//6
  fill(102, 205, 170);
  rect(xPos, yPos+bSize*5, bSize, bSize);
//7
  fill(69, 139, 116);
  rect(xPos, yPos+bSize*6, bSize, bSize);
//8
  fill(193, 255, 193);
  rect(xPos, yPos+bSize*7, bSize, bSize);
//8
  
}

void draw() {


  if (mousePressed) {



    if (790 > pmouseX && 790 > mouseX && pmouseX > 210 && mouseX > 210 && 
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    //1
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(141, 238, 238);
      strokeWeight(5);
    }

    //2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize*2) {
      stroke(121, 205, 205);
      strokeWeight(10);
    }

    //3
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2 && mouseY < yPos+bSize*3) {
      stroke(82,139,139);
      strokeWeight(20);
    }
    //4
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*3 && mouseY < yPos+bSize*4) {
      stroke(127, 255, 212);
      strokeWeight(10);
    }
    //5
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*4 && mouseY < yPos+bSize*5) {
      stroke(118, 238, 198);
      strokeWeight(5);
    }
    //6 
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*5 && mouseY < yPos+bSize*6) {
      stroke(102, 205, 170);
      strokeWeight(10);
    }
    //7
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*6 && mouseY < yPos+bSize*7) {
      stroke(69,139,116);
      strokeWeight(5);
    }
    //8
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*7 && mouseY < yPos+bSize*8) {
      stroke(193, 255, 193);
      strokeWeight(20);
    }
  }
}

