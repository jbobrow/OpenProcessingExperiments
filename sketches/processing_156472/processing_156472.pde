
float angle01;
float angle02;

//variables to interact with
int ty;
float spinRate;
float ellipseY;
float angleOffset01;
float angleOffset02;
PFont font;

void setup() {
  size (775, 500);
  background (50);
  fill (40);
  rect(0, 0, 500, 500);
  colorMode(HSB, 360);

  font = createFont("Arial", 200, true);

  //spinRate
  spinRate = 1;
  ty = 50;
  //how fast outer circle spins
  angleOffset01 = .5;
  //how fast inner circle spins
  angleOffset02 = 5;
  //how far out from the inside circle is drawn circle
  ellipseY = 20;
}

void draw () {

  // background (50);
  angle01 = (radians(frameCount*spinRate*angleOffset01));
  angle02 = (radians(frameCount*spinRate*angleOffset02));

  //BG RECT
  fill (40, 5);
  rect(0, 0, 500, 500);

  //THIS IS THE SPIROGRAPH STUFF
  pushMatrix();
  translate (250, 250);
  rotate (angle01);
  fill(255);
  ellipseMode(CENTER);
  //this is the spinning circle
  pushMatrix();
  translate (0, ty);
  rotate (angle02);
  noStroke();
  fill(angle02*5%360, 255, 255);
  ellipseMode(CENTER);
  ellipse(0, ellipseY, 10, 10);  
  popMatrix();
  popMatrix();

  //THIS IS THE GUI STUFF

  //BUTTONS
  fill(360);
  //ty buttons 
  rect(575, 50, 50, 50);
  rect(650, 50, 50, 50);
  //ellipseY buttons
  rect(575, 125, 50, 50);
  rect(650, 125, 50, 50);
  //angle offset 01 buttons
  rect(575, 200, 50, 50);
  rect(650, 200, 50, 50);
  //angle offset 02 buttons
  rect(575, 275, 50, 50);
  rect(650, 275, 50, 50);
  //spinRate buttons
  rect(575, 350, 50, 50);
  rect(650, 350, 50, 50);
  //reset button
  rect(575, 425, 125, 50);

  //TEXT
  textFont(font, 12);
  textAlign(CENTER);
  fill(255);
  text ("Guide Circle Size", 637, 115);
  text ("Rotating Circle Size", 637, 190);
  text ("Guide Rotate Speed Offset", 637, 265);
  text ("Rotating Circle Speed Offset", 637, 340);
  text ("Spin Base Rate", 637, 415);
  fill(0);
  textSize(40);
  text ("+     -", 637, 90);
  text ("+     -", 637, 165);
  text ("+     -", 637, 240);
  text ("+     -", 637, 315);
  text ("+     -", 637, 390);
  textSize(20);
  text ("RESET", 637, 460);
  
}

void mousePressed () {
  //ty add
  if (mouseX > 575 && mouseX < 625 && mouseY > 50 && mouseY < 100) {
    ty += 5;
  }
  //ty subtract
  if (mouseX > 650 && mouseX < 700 && mouseY > 50 && mouseY < 100) {
    ty -= 5;
  }
  //ellipseY add
  if (mouseX > 575 && mouseX < 625 && mouseY > 125 && mouseY < 175) {
    ellipseY += 5;
  }
  //ellipseY subtract
  if (mouseX > 650 && mouseX < 700 && mouseY > 125 && mouseY < 175) {
    ellipseY -= 5;
  }
  //angle offset 01 add
  if (mouseX > 575 && mouseX < 625 && mouseY > 200 && mouseY < 250) {
    angleOffset01 += 1;
  }
  //angle offset 01 subtract
  if (mouseX > 650 && mouseX < 700 && mouseY > 200 && mouseY < 250) {
    angleOffset01 -= 1;
  }
  //angle offset 02 add
  if (mouseX > 575 && mouseX < 625 && mouseY > 275 && mouseY < 325) {
    angleOffset02 += .5;
  }
  //angle offset 02 subtract
  if (mouseX > 650 && mouseX < 700 && mouseY > 275 && mouseY < 325) {
    angleOffset02 -= .5;
  }
  //spinRate add
  if (mouseX > 575 && mouseX < 625 && mouseY > 350 && mouseY < 400) {
    spinRate +=.1;
  }
  //spinRate subtract
  if (mouseX > 650 && mouseX < 700 && mouseY > 350 && mouseY < 400) {
    spinRate -=.1;
  }
  //reset drawing
  if (mouseX > 575 && mouseX < 700 && mouseY > 425 && mouseY < 475) {
    fill (40);
    rect(0, 0, 500, 500);
    ty = 50;
    ellipseY = 20;
    angleOffset01 = .5;
    angleOffset02 = 5;
    spinRate = 1;
  }
}



