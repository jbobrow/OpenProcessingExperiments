
PFont homeworkThree_Arabic;
String filler = "Where did I put that damn button?";
String damn = "damn";
String lie = "THE BUTTON IS A LIE";
String I = "I";
color damnColor;
color iColor;

void setup() {
  size(800, 400);
  homeworkThree_Arabic = loadFont ("homeworkThree_Arabic.vlw");
  filler = "Where did I put that damn button?";
  damnColor = color(255);
  iColor = color(255);
}

void draw() {
  background(103, 84, 55);
  textFont(homeworkThree_Arabic, 40);
  fill(255);
  text(filler, 3, 30);
  text(filler, 3, 70);
  text(filler, 3, 110);
  text(filler, 3, 150);
  text(filler, 3, 190);
  text(filler, 3, 230);
  text(filler, 3, 270);
  text(filler, 3, 310);
  text(filler, 3, 350);
  text(filler, 3, 390);
  fill(damnColor);
  text(damn, 507, 110);
  fill(iColor);
  text(I, 243, 270);
  noFill();
  noStroke();
  ellipse(550, 96, 40, 40);
  ellipse(254, 255, 40, 40);

  if (mousePressed) {
    background(0);
    textFont(homeworkThree_Arabic, 60);
    fill(255, 0, 0);
    text(lie, 45, 200);
  }
  else {
    background(103, 84, 55);
    textFont(homeworkThree_Arabic, 40);
    fill(255);
    text(filler, 3, 30);
    text(filler, 3, 70);
    text(filler, 3, 110);
    text(filler, 3, 150);
    text(filler, 3, 190);
    text(filler, 3, 230);
    text(filler, 3, 270);
    text(filler, 3, 310);
    text(filler, 3, 350);
    text(filler, 3, 390);
    fill(damnColor);
    text(damn, 507, 110);
    fill(iColor);
    text(I, 243, 270);
    noFill();
    noStroke();
    ellipse(550, 96, 40, 40);
    ellipse(254, 255, 40, 40);

    if (dist(mouseX, mouseY, 550, 96) < 20) {
      fill(255);
      rect(0,0,800,400);
      damnColor = color(10, 10, 255);
      fill(damnColor);
      text(damn, 507, 110);
      
    }
    else {
      damnColor = color(255);
      noFill();
      rect(0,0,800,400);
    }
    if (dist(mouseX, mouseY, 254, 255) < 20) {
      fill(255);
      rect(0,0,800,400);
      iColor = color(10, 10, 255);
      fill(iColor);
      text(I, 243, 270);
    }
    else {
      iColor = color(255);
      noFill();
      rect(0,0,800,400);
    }
  }
}


