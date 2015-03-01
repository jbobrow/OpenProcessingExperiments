
int xPos = 75;
int yPos = 75;
int bSize = 30;

void setup() {
  size(800, 600);
  background(0);

  //drawing board
  fill(0);
  rect(200, 0, 600, 600);

  //buttons 
  fill(255, 255, 255);
  rect(xPos, yPos, bSize, bSize);
  fill(255, 255, 200);
  rect(xPos, yPos+bSize, bSize, bSize);
  fill(255, 200, 255);
  rect(xPos, yPos+bSize*2, bSize, bSize);
   fill(200, 255, 255);
  rect(xPos, yPos+bSize*3, bSize, bSize);
  fill(200, 200, 255);
  rect(xPos, yPos+bSize*4, bSize, bSize);
  fill(200, 255, 200);
  rect(xPos, yPos+bSize*5, bSize, bSize);
  fill(255, 200, 200);
  rect(xPos, yPos+bSize*6, bSize, bSize);
  fill(0, 0, 0);
  stroke(0);
  rect(xPos, yPos+bSize*7, bSize, bSize);
}

void draw() {

  if (mousePressed) {

    //brush 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 210 && mouseX > 210 && 
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


    //b1 
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(255, 255, 255);
      strokeWeight(random(1,10));
    }
    //b2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize+bSize) {
      stroke(255, 255, 200);
      strokeWeight(random(1,10));
    }

    //b3
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY < yPos+bSize+bSize+bSize) {
      stroke(255,200,255);
      strokeWeight(random(1,10));
    }
      //b4
      if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize) {
      stroke(200,255,255);
      strokeWeight(random(1,10));
    }
    //b5
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(200,200,255);
      strokeWeight(random(1,10));
    }
    //b6
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(200,255,200);
      strokeWeight(random(1,10));
    }
    //b7
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(255,200,200);
      strokeWeight(random(1,10));
    }
    //eraser
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(0);
      strokeWeight(random(1,10));
    }
  }
}

