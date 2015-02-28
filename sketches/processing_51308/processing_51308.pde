
// Georgina Yeboah
// PS1
// question 1


// This will be a suprised face
void setup () {
  size (300, 300);
  background (49, 255, 212);
  PFont font;
  loadFont ("Aharoni-Bold-48.vlw");
  text ("SUPRISE!!", 115, 250);
}

void draw () {
  smooth ();
  //head
  ellipse (140, 120, 150, 150);
  // mouth
  ellipse (140, 150, 50, 50);
  // eyes
  ellipse (110, 90, 30, 30);
  ellipse (170, 90, 30, 30);
  // nose
  ellipse (140, 110, 10, 10);
}


