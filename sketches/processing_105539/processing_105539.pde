
int xPos=0;

void setup() {
  smooth();
  size(800, 200);
  noStroke();
}

void draw() {
  fill(62, 153, 170);
  rect(0, 0, width, height);

  //this adds houses as long as there is width on the screen
  for (int i=0; i<width; i=i+60) {
    drawHouse(i, height-40);
  }

  //this moves the sun
  for (int i=0; i<width-40;i++) {
    drawSun(i, height/3);
  }
}

void drawHouse(int xPos, int yPos) {
  fill(247, 235, 207);
  rect(xPos, yPos, 40, 40);
  fill(183, 126, 4);
  rect(xPos+10, yPos+15, 20, 25);
  fill(185, 15, 6);
  triangle(xPos, yPos, xPos+20, yPos-20, xPos+40, yPos);
}

void drawSun(int xPos, int yPos) {
  fill(62, 153, 170);
  rect(xPos-40, yPos-40, 40, 80);
  fill(240, 224, 75);
  ellipse(xPos, yPos, 40, 40);
}



