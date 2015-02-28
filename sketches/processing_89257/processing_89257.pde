
/*
 *  Title: P07_03_KeyboardInteraction
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that responds to keyboard input by changing
 *    some aspect of the drawing or a behavior. 
 */
 
// This palette is "Bahamas" by learnedt15
// See https://kuler.adobe.com/#themeID/2238023

color[] palette = {#003056, #04518C, #00A1D9, #47D9BF, #F2D03B};

boolean rToggle = true;  // Creates toggle variable for rectangles
boolean lToggle = true;  // Creates toggle variable for lines
boolean dToggle = true;  // Creates toggle variable for dots

int sw = 1;              // Adjusts stroke weight of lines

void setup() {
  size(600, 400);
  smooth();
  rectMode(CORNERS);
  frameRate(10);

  background(palette[0]);

  fill(palette[3]);
  text("move mouse quickly...", 10, 20);
  text("spacebar: erase", 10, 40);
  text("r: toggle rectangles", 10, 60);
  text("d: toggle dots", 10, 80);
  text("l: toggle lines", 10, 100);
  text("a: all on", 10, 120);
  text("up arrow thickens lines", 10, 140);
  text("down arrow narrows lines", 10, 160);
}

void draw() {
  noStroke();
  
  if (rToggle) {  
    fill(palette[int(random(1,4))], 40);
    rect(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  if (dToggle) {  
    fill(palette[4], 80);
    ellipse(mouseX, mouseY, 5, 5);
  }
  
  if (lToggle) {  
    stroke(palette[4], 80);
    strokeWeight(sw);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void keyPressed() {
  
  if (key == ' ') {
    background(palette[0]);
    fill(palette[3]);
    text("move mouse quickly...", 10, 20);
    text("spacebar: erase", 10, 40);
    text("r: toggle rectangles", 10, 60);
    text("d: toggle dots", 10, 80);
    text("l: toggle lines", 10, 100);
    text("a: all on", 10, 120);
    text("up arrow thickens lines", 10, 140);
    text("down arrow narrows lines", 10, 160);
  }
  
  if ((key == 'r') || (key == 'R')) rToggle = !rToggle;
  if ((key == 'd') || (key == 'D')) dToggle = !dToggle;
  if ((key == 'l') || (key == 'L')) lToggle = !lToggle;
  
  if (key == CODED) {
    if (keyCode == UP) sw++;
    if (keyCode == DOWN) sw--;
    sw = constrain(sw, 1, 20);
  }
  
  if ((key == 'a') || (key == 'A')) {
    rToggle = true;
    lToggle = true;
    dToggle = true;
  } 
}
