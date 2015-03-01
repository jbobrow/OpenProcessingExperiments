
int xPos = 50;
int yPos = 50;
int bSize = 35;
int cSize = 15;

void setup() {
  size(800, 600);
  background(0);

  //shape free
  noStroke();
  fill(255);
  rect(200, 0, 600, 600);

  //color button
  fill(227, 94, 170);
  rect(xPos, yPos, bSize, bSize);
  fill(232, 174, 191);
  rect(xPos*2+cSize, yPos, bSize, bSize);

  fill(107, 214, 208);
  rect(xPos, yPos*2+cSize, bSize, bSize);
  fill(81, 158, 200);
  rect(xPos*2+cSize, yPos*2+cSize, bSize, bSize);


  //eraser
  fill(255);
  rect(xPos*2+cSize, yPos*7+cSize*4, bSize, bSize);



  //stroke weight
  stroke(255);
  fill(0);
  strokeWeight(1);
  rect(xPos, yPos*4+cSize*2, bSize, bSize);
  strokeWeight(3);
  rect(xPos*2+cSize, yPos*4+cSize*2, bSize, bSize);
  strokeWeight(5);
  rect(xPos, yPos*5+cSize*3, bSize, bSize);
  strokeWeight(7);
  rect(xPos*2+cSize, yPos*5+cSize*3, bSize, bSize);
}


void draw() {


  //color

  if (mousePressed) { 
    if  (800 > pmouseX && 800 > mouseX && pmouseX > 200 && mouseX > 200 &&
      600 > pmouseY && 600 > mouseY && pmouseY> 0 && mouseY> 0 == true) {

      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    if ( mouseX >xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(227, 94, 170);
    }

    if ( mouseX >xPos*2+cSize && mouseX < xPos*2+cSize+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(232, 174, 191);
    }

    if ( mouseX >xPos && mouseX < xPos+bSize && mouseY > yPos*2+cSize && mouseY < yPos*2+cSize+bSize) {
      stroke(107, 214, 208);
    }

    if ( mouseX >xPos*2+cSize && mouseX < xPos*2+cSize+bSize && mouseY > yPos*2+cSize && mouseY < yPos*2+cSize+bSize) {
      stroke(81, 158, 200);
    }

    //stroke Weight

    if (mousePressed) { 
      if  (800 > pmouseX && 800 > mouseX && pmouseX > 200 && mouseX > 200 &&
        600 > pmouseY && 600 > mouseY && pmouseY> 0 && mouseY> 0 == true) {

        line(pmouseX, pmouseY, mouseX, mouseY);
      }

      if ( mouseX >xPos && mouseX < xPos+bSize && mouseY > yPos*4+cSize*2 && mouseY < yPos*4+cSize*2+bSize) {
        strokeWeight(1);
        rect(xPos, yPos*4+cSize*2, bSize, bSize);
      }

      if ( mouseX >xPos*2+cSize && mouseX < xPos*2+cSize+bSize && mouseY > yPos*4+cSize*2 && mouseY < yPos*4+cSize*2+bSize) {
        strokeWeight(3);
        rect(xPos*2+cSize, yPos*4+cSize*2, bSize, bSize);
      }

      if ( mouseX >xPos && mouseX < xPos+bSize && mouseY > yPos*5+cSize*3 && mouseY < yPos*5+cSize*3+bSize) {
        strokeWeight(5);
        rect(xPos, yPos*5+cSize*3, bSize, bSize);
      }

      if ( mouseX >xPos*2+cSize && mouseX < xPos*2+cSize+bSize && mouseY > yPos*5+cSize*3 && mouseY < yPos*5+cSize*3+bSize) {
        strokeWeight(7);
        rect(xPos*2+cSize, yPos*5+cSize*3, bSize, bSize);
      }
    }

    //eraser
    if ( mouseX >xPos*2+cSize && mouseX < xPos*2+cSize+bSize && mouseY >yPos*7+cSize*4 && mouseY < yPos*7+cSize*4+bSize) {
      noStroke();
      fill(255);
      rect(200, 0, 600, 600);
    }
  }
}

