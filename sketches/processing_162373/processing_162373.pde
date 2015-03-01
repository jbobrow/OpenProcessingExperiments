
int xPos = 30;
int yPos = 30;
int bSize = 30;

void setup() {

  size(800, 600);
  background(200, 200, 200);
  noStroke();

  fill(100, 100, 100);
  rect(10, 10, 780, 580);
  fill(255, 255, 255);
  rect(90, 30, 680, 540);



  //button
  fill(96, 6, 6);
  rect(xPos, yPos, bSize, bSize);
  fill(255, 0, 0);
  rect(xPos, yPos+bSize, bSize, bSize);
  fill(255, 145, 0);
  rect(xPos, yPos+bSize*2, bSize, bSize);
  fill(255, 200, 0);
  rect(xPos, yPos+bSize*3, bSize, bSize);
  fill(255, 255, 0);
  rect(xPos, yPos+bSize*4, bSize, bSize);
  fill(168, 255, 0);
  rect(xPos, yPos+bSize*5, bSize, bSize);
  fill(0, 255, 0);
  rect(xPos, yPos+bSize*6, bSize, bSize);
  fill(0, 255, 242);
  rect(xPos, yPos+bSize*7, bSize, bSize);
  fill(0, 200, 255);
  rect(xPos, yPos+bSize*8, bSize, bSize);
  fill(0, 100, 255);
  rect(xPos, yPos+bSize*9, bSize, bSize);
  fill(130, 0, 255);
  rect(xPos, yPos+bSize*10, bSize, bSize);

  fill(176, 211, 244);
  rect(xPos, yPos+bSize*11, bSize, bSize);
  fill(163, 239, 210);
  rect(xPos, yPos+bSize*12, bSize, bSize);
  fill(244, 232, 171);
  rect(xPos, yPos+bSize*13, bSize, bSize);
  fill(255, 215, 223);
  rect(xPos, yPos+bSize*14, bSize, bSize);
  fill(0, 0, 0);
  rect(xPos, yPos+bSize*15, bSize, bSize);
  fill(255, 255, 255);
  stroke(0,0,0);
  rect(xPos-5, yPos+bSize*17-10, bSize+10, bSize+10);
}




void draw() {

  if (mousePressed) {


    if (770 > pmouseX && 770 > mouseX && pmouseX > 90 && mouseX > 90 &&
      570 > pmouseY && 570 > mouseY && pmouseY> 30 && mouseY> 30) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }

  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
    stroke(96, 6, 6);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize*2) {
    stroke(255, 0, 0);
    strokeWeight(3);
  }

  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2 && mouseY <yPos+bSize*3) {
    stroke(255, 145, 0);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*3 && mouseY <yPos+bSize*4) {
    stroke(255, 200, 0);
    strokeWeight(3);
  }
  if ( mouseX > xPos&& mouseX < xPos+bSize && mouseY > yPos+bSize*4 && mouseY <yPos+bSize*5) {
    stroke(255, 255, 0);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*5 && mouseY <yPos+bSize*6) {
    stroke(168, 255, 0);
    strokeWeight(3);
  }

  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*6 && mouseY <yPos+bSize*7) {
    stroke(0, 255, 0);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*7 && mouseY <yPos+bSize*8) {
    stroke(0, 255, 242);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*8 && mouseY <yPos+bSize*9) {
    stroke(0, 200, 255);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*9 && mouseY <yPos+bSize*10) {
    stroke(0, 100, 255);
    strokeWeight(3);
  }
  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*10 && mouseY <yPos+bSize*11) {
    stroke(130, 0, 255);
    strokeWeight(3);
  }





  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*11&& mouseY <yPos+bSize*12) {
    stroke(176, 211, 244);
    strokeWeight(7);
  }


  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*12&& mouseY <yPos+bSize*13) {
    stroke(163, 239, 210);
    strokeWeight(7);
  }  





  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*13 && mouseY <yPos+bSize*14) {
    stroke(244, 232, 171);
    strokeWeight(7);
  }


  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*14 && mouseY <yPos+bSize*15) {
    stroke(244, 215, 223);
    strokeWeight(7);
  }

  if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*15 && mouseY <yPos+bSize*16) {
    stroke(0, 0, 0);
    strokeWeight(7);
  }



  if ( mouseX > xPos-5 && mouseX < xPos+bSize+5 && mouseY > yPos+bSize*17-10 && mouseY <yPos+bSize*18) {
    noStroke();
      fill(255);
      rect(90, 30, 680, 540);


  }
  
}
  
  
  
