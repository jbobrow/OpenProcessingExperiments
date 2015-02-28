
// Matthew Linklater
// Collage of Ideas
// Interpretation of Traffic

PImage bgroundRight;
PImage bgroundLeft;
PImage bgroundRightBW;
PImage bgroundLeftBW;
PImage johnCage;
PImage johnCageBeat;
PImage glitch;
PImage glitchBW;
PImage red;
PImage yellow;
PImage green;
PImage staticFilter;

void setup(){
  size(1200, 750);
  background(255);
  bgroundRight = loadImage("traffic.jpg");
  bgroundRightBW = loadImage("trafficbw.jpg");
  bgroundLeft = loadImage("traffic1.jpg");
  bgroundLeftBW = loadImage("traffic1bw.jpg");
  johnCage = loadImage("johncage.png");
  johnCageBeat = loadImage("johncagebeat.png");
  glitch = loadImage("glitchmob.png");
  glitchBW = loadImage("glitchmobbw.png");
  red = loadImage("red.png");
  yellow = loadImage("yellow.png");
  green = loadImage("green.png");
  staticFilter = loadImage("static.jpg");
}

void draw(){
  
  float colorWorld = dist(mouseX, mouseY, 600, 470);
  
  // Background  
  if (colorWorld < 120 && colorWorld > 100){
    image(bgroundLeft, 0, 0, 808, 750);
    image(bgroundRight, 600, 0, 1090, 750);
    image(glitch, 950, 334, 250, 416);
    tint(255, 126);
    image(staticFilter, 0, 0, 1200, 750);
    noTint();
    image(yellow, 30, 250, 157, 500); 
    image(johnCageBeat, 240, 308, 720, 481);
  } else if (colorWorld <= 100){
    image(bgroundLeft, 0, 0, 808, 750);
    image(bgroundRight, 600, 0, 1090, 750);
    image(glitch, 950, 334, 250, 416);
    image(green, 30, 250, 157, 500);
    image(johnCage, 250, 318, 700, 468);
  } else {
    image(bgroundLeftBW, 0, 0, 808, 750);
    image(bgroundRightBW, 600, 0, 1090, 750);
    image(glitchBW, 950, 334, 250, 416);
    image(red, 30, 250, 157, 500);
    image(johnCage, 250, 318, 700, 468);
  }
  
}


