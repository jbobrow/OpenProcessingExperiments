
/**
 * Kinetic Type 
 * by Zach Lieberman. 
 * 
 * Using push() and pop() to define the curves of the lines of type. 
 */
 
Line ln;
Line lns[];

String words[] = {
  "HAPPY HAPPY", "BIRTHDAY", "TO MATT!!!"
};

void setup() {
  size(608, 456, P3D);
  
  // Array of line objects
  lns = new Line[3];

  // Load the font from the sketch's data directory
  textFont(loadFont("Univers-66.vlw"), 1.0);

  // White type
  fill(255, 62, 150);

  // Creating the line objects
  for(int i = 0; i < 3; i++) {
    // For every line in the array, create a Line object to animate
    // i * 70 is the spacing
    ln = new Line(words[i], 0, i * 70);
    lns[i] = ln;
  }
}

void draw() {
  background(255);
  
  translate(-200, -50, -450);
  rotateY(0.3);

  // Now animate every line object & draw it...
  for(int i = 0; i < 3; i++) {
    float f1 = sin((i + 1.0) * (millis() / 10000.0) * TWO_PI);
    float f2 = sin((3.0 - i) * (millis() / 10000.0) * TWO_PI);
    Line line = lns[i];
    pushMatrix();
    translate(0.0, line.yPosition, 0.0);
    for(int j = 0; j < line.myLetters.length; j++) {
      if(j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 75, 0.0, 0.0);
      }
      rotateY(f1 * 0.5 * f2);
      pushMatrix();
      scale(75.0);
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    }
    popMatrix();
  }
}


