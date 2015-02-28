
PImage smoke_white;
PImage smoke_red;
PImage smoke_yellow;
PImage smoke_green;
PImage cigarette;

int counter = 0;

PFont myFont;

void setup () {

  size (500, 500);
  background (255, 255, 255);
  smoke_white = loadImage ("smoke1.png");
  smoke_red = loadImage ("smoke2.png");
  smoke_yellow = loadImage ("smoke3.png");
  smoke_green = loadImage ("smoke4.png");
  cigarette = loadImage ("cigarette.png");

  myFont = createFont("Helvetica", 60, false);


  cursor(cigarette, mouseX, mouseY);
}

void draw () {
}

void mouseDragged () {
  if (counter < 5) {
    if (key == 'q') {
      image (smoke_white, mouseX - 50, mouseY - 50);
      filter(DILATE);
      fill(0);
      textFont(myFont);
      text("Q", 170, 50);
    } 
    else if (key == 'u') {
      image (smoke_red, mouseX - 50, mouseY - 50);
      filter(DILATE);
      textFont(myFont);
      text("QU", 170, 50);
    } 
    else if (key == 'i') {
      image (smoke_yellow, mouseX - 50, mouseY - 50);
      filter(DILATE);
      textFont(myFont);
      text("QUI", 170, 50);
    }
    else if (key == 't') {
      image (smoke_green, mouseX - 50, mouseY - 50);
      filter(DILATE);
      textFont(myFont);
      text("QUIT", 170, 50);
    }
  } 
  else {
    image (smoke_green, mouseX - 50, mouseY - 50);
    filter(BLUR); 
    textFont(myFont);
    text("SMOKING", 120, 50);
  }
}

void keyPressed() {

  counter++;
}


