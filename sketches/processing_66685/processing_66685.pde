
float ballW = 18;
PFont aFont;
PFont bFont;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  noFill();
}


void draw() {
  background(255);

  //set squiggly wire
  drawRect(0, 0, 100, 100, color(255, 0, 13)); //finish
  drawRect(100, 40, 100, 20, color(255, 0, 13));
  drawRect(200, 40, 20, 140, color(255, 0, 13));
  drawRect(100, 160, 100, 20, color(255, 0, 13));
  drawRect(100, 160, 20, 200, color(255, 0, 13));
  drawRect(100, 340, 300, 20, color(255, 0, 13));
  drawRect(300, 300, 100, 100, color(255, 0, 13)); //start

  //go outside the wire #1
  if (mouseX >= 0 && mouseX-ballW/2 <= 100 && mouseY+ballW/2 > 100 && mouseY < 400) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("YEAH!", 55, 240);
  }
  //go outside the wire #2
  if (mouseX+ballW/2 > 100 && mouseX < 400 && mouseY > 0 && mouseY-ballW/2 < 40) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("HAHA!", 45, 240);
  }
  //go outside the wire #3
  if (mouseX+ballW/2 > 100 && mouseX-ballW/2 < 200 && mouseY+ballW/2 > 60 && mouseY-ballW/2 < 160) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("SRRY!", 53, 240);
  }
  //go outside the wire #4
  if (mouseX+ballW/2 > 120 && mouseX-ballW/2 < 300 && mouseY+ballW/2 > 180 && mouseY-ballW/2 < 340) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("HAHA!", 45, 240);
  }
  //go outside the wire #5
  if (mouseX+ballW/2 > 100 && mouseX-ballW/2 < 300 && mouseY+ballW/2 > 360 && mouseY < 400) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("YEAH!", 55, 240);
  }
  //go outside the wire #6
  if (mouseX+ballW/2 > 300 && mouseX < 400 && mouseY+ballW/2 > 180 && mouseY-ballW/2 < 300) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("SRRY!", 53, 240);
  }
  //go outside the wire #7
  if (mouseX+ballW/2 > 220 && mouseX < 400 && mouseY+ballW/2 > 40 && mouseY-ballW/2 < 180) {
    //fill red
    fill(255, 0, 13);
    rect(0, 100, 100, 400);
    rect(100, 0, 300, 40);
    rect(100, 60, 100, 100);
    rect(120, 180, 180, 160);
    rect(100, 360, 200, 40);
    rect(220, 40, 180, 140);
    rect(300, 160, 100, 140);
    //show text
    bFont = loadFont("Pigiarniq-Bold-100.vlw");
    fill(255);
    textFont(bFont);
    text("YEAH!", 53, 240);
  }

  //draw ball
  fill(0);
  ellipse(mouseX, mouseY, ballW, ballW);
}

//draw squiggly wire
void drawRect(int rX, int rY, int rW, int rH, color c) {
  noStroke();
  fill(c);
  rect(rX, rY, rW, rH);

  //place font
  aFont = loadFont("Pigiarniq-Bold-20.vlw");
  fill(255);
  textFont(aFont);
  text("START", 16, 57);
  text("FINISH", 318, 357);
}


