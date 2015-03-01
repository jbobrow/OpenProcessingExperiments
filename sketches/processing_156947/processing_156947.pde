
// Clouds as drawn by Mala Kumar
// Totoro Sticker drawn by Clawshawt

PImage totoroL;
PImage totoroR;
PFont font;

int r, pos;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  totoroL = loadImage("totoroL.png");
  totoroR = loadImage("totoroR.png");
  r = 0;
  pos = -401;
  font = loadFont("data/DFLiuLiU-W7-WIN-BF-48.vlw");
}

void draw() {
  background(255);
  if (mousePressed) {
    showTitle(150, 240);
    moveTotoro();
    drawCloud(mouseX, mouseY, 252, 217, 229);
  }
  else {
    showTitle(150, 240);
    moveTotoro();
    drawCloud(mouseX, mouseY, 220, 249, 249); 
  }
}

void drawCloud(int x, int y, int fillR, int fillG, int fillB) {
  noStroke();
  fill(fillR, fillG, fillB);
  ellipse(x+100, y+50, 60, 60);  
  ellipse(x+125, y+55, 50, 50);  
  ellipse(x+150, y+60, 30, 30);  
  ellipse(x+70, y+60, 30, 30);  
}

void moveTotoro() {
  if (r == 0 && pos < 600) {  // to right
    image(totoroR, pos, 250, totoroR.width/2, totoroR.height/2);
    pos += 3;
    if (pos > 600) {
      r = 1;
    }
  } else if (r == 1 && pos > -400) {  // to left
    image(totoroL, pos, 250, totoroL.width/2, totoroL.height/2);
    pos -= 3;
    if (pos < -400) {
      r = 0;
    }
  } 
}

void showTitle(int titleX, int titleY) {
  textFont(font, 32);
  fill(0);
  text("The Neighbor Totoro", titleX, titleY); 
}



