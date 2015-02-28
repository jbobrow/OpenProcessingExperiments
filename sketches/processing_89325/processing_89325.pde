
int brushType = 1;
int hue = 0;
int fontSize = 20;
int textLine = 1;


void setup() {
  size(600, 600);
  background(255);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  textAlign(CENTER, CENTER);
}

void draw() {
  textSize(fontSize);
 // Brush 1: Simple Color
 if (mousePressed && brushType == 1) {
   fill(hue, 100, 100);
   ellipse(mouseX, mouseY, 30, 30);
 }
 // Brush 2: Rainbow Rumpus Partytown Revenge
 if (mousePressed && brushType == 2) {
    for (int i=0; i<20; i++) {
    fill(hue, random(0, 100), random(0, 100), 100);
    ellipse(mouseX, random(0, width), random(30, 60), random(30, 60));
    ellipse(random(0, height), mouseY, random(30, 60), random(30, 60));
   }
 }
 // Brush 3: Disturbing Screams of the Damned
 if (mousePressed && brushType == 3) {
   fill(0, 100, 0, 100);
   if (textLine == 1) {
     text("HELP ME", mouseX, mouseY);
   }
   else if (textLine == 2) {
     text("I'M SCARED", mouseX, mouseY);
   }
   else if (textLine == 3) {
     text("LET ME OUT", mouseX, mouseY);
   }
   else if (textLine == 4) {
     text("IT'S TERRIFYING", mouseX, mouseY);
   }
   else if (textLine == 5) {
     text("THE COMPUTER", mouseX, mouseY);
   }
   else if (textLine == 6) {
     text("OUCH OUCH OUCH", mouseX, mouseY);
   }
   else if (textLine == 7) {
     text("DON'T COVER ME UP", mouseX, mouseY);
   }
 }
 
 
   if (keyPressed) {
    brushType = 3;
  }
}

void mouseReleased() {
  hue = hue+30;
  if (hue >= 360) {
    hue = 0;
  }
  fontSize = fontSize;
  textLine++;
  if (textLine == 8) {
    textLine = 1;
  }
  if (mouseButton == RIGHT) {
    brushType = 2;
  }
  if (mouseButton == CENTER) {
    brushType = 1;
  }
}


