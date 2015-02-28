
//***************************
// Project: LITR0110D Reading Display
// Author: Matthew Malin
//

// Globals
color bg = color(0.0,0.0,0.0);
float pangle = 0.0;
float pcorner = 1.0;
float ptranslate[] = {0.0, 0.0, 0.0};

PFont font;
String names[];
int name_index = 0;
Boolean next_name = false;
// End Globals

// Initialize Sketch
void setup() {
  size(400,400,P3D);
  frameRate(60);
  
  font = loadFont("Aparajita-24.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  
  rectMode(CORNER);
  noStroke();
  
  names = loadStrings("data/names.txt");
}

// Main Loop
void draw() {
  // Clear screen
  background(bg);
  
  // Apply 3D tranformations
  translate(ptranslate[0] + width/2.0, ptranslate[1] + height/2.0, ptranslate[2]);
  rotateY(pangle);
  rotateX(pangle*pcorner);
  
  // Draw Shapes
  fill(255,255,255);
  rect(-150, -50, 300.0, 100.0);
  if(pangle%(2*PI) < PI/2 || pangle%(2*PI) > 3*PI/2) {
    next_name = true;
    fill(0,0,0);
    text(names[name_index], 0.0, 0.0, 5.0);
  } else {
    if(next_name) {
      name_index = (name_index + 1)%names.length;
      next_name = false;
    }
  }
  
  // Update Params 
  pangle += 0.01;
}

