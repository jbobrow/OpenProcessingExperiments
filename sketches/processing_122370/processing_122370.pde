
/* @pjs preload="rageMan.jpg"; */

PImage rage;
// Simple painting program
// Daniel Jovanov: 13 February 2013
void setup() {
  size(700,700);
  rage = loadImage("rageMan.jpg");
}

// Draw instructions for this program on the screen
void drawInstructions() {
  // first, draw the word "KEYS:"
  // 'K'
  line(75,18,75,60);
  line(75,39,104,18);
  line(75,39,104,60);
  // 'E'
  line(126,18,126,60);
  line(126,18,155,18);
  line(126,39,155,39);
  line(126,60,155,60);
  // 'Y'
  line(176,18,190,39);
  line(205,18,190,39);
  line(190,39,190,60);
  // 'S'
  line(230,34,258,18);
  line(230,34,258,50);
  line(258,50,230,60);
  // ':'
  point(280,32);
  point(280,48);
  
  // next, draw the numbers
  // 1
  line(330,18,316,28);
  line(330,18,330,60);
  // 2
  line(345,28,360,18);
  line(360,18,375,28);
  line(375,28,345,60);
  line(345,60,375,60);
  // 3
  line(400,28,415,18);
  line(415,18,430,28);
  line(430,28,415,36);
  line(415,36,430,48);
  line(430,48,415,60);
  line(415,60,400,48);
}



void draw() {
  stroke(0);
  
  // Draw instructions
  drawInstructions();
  
  if (key == '1') {
    frameRate(60);
    // conventional painting
    if ((mousePressed == true) && (mouseButton == LEFT)) 
      line(mouseX,mouseY,pmouseX,pmouseY);
  }
  if (key == '2') {
    frameRate(60);
    // slightly less conventional painting
    if ((mousePressed == true) && (mouseButton == LEFT))
      image(rage, mouseX, mouseY, 100, 100);
  }
  if (key == '3') {
    // unconventional painting--just reuse code from "Glitch Art"
    if ((mousePressed == true) && (mouseButton == LEFT)) {
      frameRate(random(4,60));
      fill(random(255), random(255), random(255));
      rect(mouseX, mouseY, random(700), random(700));
    }
  }
}


