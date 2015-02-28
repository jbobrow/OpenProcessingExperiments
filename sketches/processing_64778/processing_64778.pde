
/**
//Josephine Gibbs
 * MY SANITY
 * after Zach Lieberman. 
 * 
 * Using push() and pop() to define the curves of the lines of type. 
 */
 
Line ln;
Line lns[];

String words[] = {
  "My Sanity", "Today went down the drain trying to work on this", "I'm sick of 'mixing static & active' error messages", "that pretty soon...",
  "I'm about to jump off a bridge,", "can you blame me?", "Isn't it obvious on this page",
  "that i'm crying out for help."
};

void setup() {
  size(640, 360, P3D);
  background(399, mouseX,mouseY);
  fill(399, random(0, 400));
  
  // Array of line objects
  lns = new Line[8];

  // Load the font from the sketch's data directory
  textFont(loadFont("Bauhaus93-48.vlw"), 1.0);

  // White type
  fill(0);

  // Creating the line objects
  for(int i = 0; i < 8; i++) {
    // For every line in the array, create a Line object to animate
    // i * 70 is the spacing
    ln = new Line(words[i], 0, i * 70);
    lns[i] = ln;
  }
}

void draw() {
  background(399);
  fill(0);
  
  translate(-200, -50, -450);
  rotateY(0.3);

  // Now animate every line object & draw it...
  for(int i = 0; i < 8; i++) {
    float f1 = sin((i + 1.0) * (millis() / 20000.0) * TWO_PI);
    float f2 = sin((8.0 - i) * (millis() / 20000.0) * TWO_PI);
    Line line = lns[i];
    pushMatrix();
    translate(0.0, line.yPosition, 0.0);
    for(int j = 0; j < line.myLetters.length; j++) {
      if(j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 75, 0.0, 0.0);
      }
      rotateY(f1 * 0.005 * f2);
      pushMatrix();
      scale(80.0);
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    }
    popMatrix();
  }
   line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66);
 ellipse(mouseX, mouseY-15, mouseX, mouseY+15);
 if(mousePressed) {
arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);
 } 
}


