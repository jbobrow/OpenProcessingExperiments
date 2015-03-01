
PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
int xPos = 85;
int yPos = 75;
int bSize = 30;

void setup() {

  size(800, 600);
  background(60);
  font = loadFont("ArialMT-48.vlw");

  // drawing space
  fill(150);
  rect(200, 0, 600, 600);


  // color variation
  fill(255, 0, 0);
  rect(xPos, yPos, 30, 30);

  fill(255, 255, 0);
  rect(xPos, yPos*2, bSize, bSize);

  fill(0, 0, 255);
  rect(xPos, yPos+yPos*2, bSize, bSize);

  fill(0);
  rect(xPos, yPos+yPos*3, bSize, bSize);

  // strokeweight
  fill(50);
  rect(xPos, yPos+yPos*4, bSize, bSize);
  fill(255);
  ellipse(xPos+15, yPos+yPos*4+15, 3, 3);

  fill(50);
  rect(xPos, yPos+yPos*5, bSize, bSize);
  fill(255);
  ellipse(xPos+15, yPos+yPos*5+15, 8, 8);

  fill(50);
  rect(xPos, yPos+yPos*6, bSize, bSize);
  fill(255);
  ellipse(xPos+15, yPos+yPos*6+15, 12, 12);
}

void draw() {

  textFont(font, 20);
  text("PAINTING TOOL", 10, 30);


  textFont(font, 10);
  text("COLOR", 10, yPos-5);

  textFont(font, 10);
  text("STROKE", 10, yPos*5-5);

  textFont(font, 12);
  text("1pt", xPos+6, yPos*6-25);

  textFont(font, 12);
  text("4pt", xPos+6, yPos*7-25);

  textFont(font, 12);
  text("8pt", xPos+6, yPos*8-25);




  if (mousePressed) {

    // color change
    if ( mouseX > 200 && mouseX < 780 && mouseY > 0  && mouseY < 600  == true) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos  && mouseY < yPos+bSize) {
      stroke(255, 0, 0);
    }


    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos*2  && mouseY < yPos*2+bSize) {
      stroke(255, 255, 0);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+yPos*2 && mouseY < yPos+yPos*2+bSize) {
      stroke(0, 0, 255);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+yPos*3 && mouseY < yPos+yPos*3+bSize) {
      stroke(0);
    }


    // stroke change
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+yPos*4  && mouseY < yPos+yPos*4-15+bSize) {
      strokeWeight(1);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+yPos*5  && mouseY < yPos+yPos*5+15+bSize) {
      strokeWeight(4);
    }

    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+yPos*6  && mouseY < yPos+yPos*6+15+bSize) {
      strokeWeight(8);
    }
  }
}
