
// Ben Turner

// NYU-ITP ICM

/* Use mouse and keyboard input to create an interactive drawing. Design your program
 * to achieve certain visual goals and try to structure your program so that no matter
 * what your user does the output always meets these goals. This means the interactor is
 * "always right" nothing they can do potentially goes contrary to your design goals. be
 * prepared to discuss your designa and interaction goals. */

// Heavily influenced by my badass classmate Engen Ayez's badass sketch:
// http://enginayaz.wordpress.com/2011/09/20/disappearing-ideas-an-interactive-animation-sketch-in-processing/

// count is used to track which sector of the screen is "active" to display the letters to
long count = 0;
PFont f;

void setup() {
  size(400, 400);
  f = loadFont("Helvetica-48.vlw");  
  smooth();
  background(255);
}

// if a key is pressed, "CALL YOUR MUM" (barring timing issues) will be displayed in the
// sectors they're allowed to be drawn in by default
void keyPressed() {
  textFont(f,80);
  rotate(0);
  fill(0, 70);
  text("C",30,100);
  text("A",130,100);
  text("L",230,100);
  text("L",330,100);
  text("Y",30,350);
  text("O",130,350);
  text("U",230,350);
  text("R",330,350);
  text("M",75,225);
  text("U",175,225);
  text("M",275,225);
}

// if mousePressed is pressed, allows you to draw characters anywhere, also prints CALL YOUR MUM
void mousePressed() {
  strokeWeight(2);
  fill(176, 0, random(252));
  text("CALL YOUR MUM", mouseX, mouseY);
}

void draw() {
  float a = random(100); // creates a random font size to draw each letter
  int randomTextSize = int(a); // have to convert floats via randomizer to int
  textFont(f, a);
  if (count >= 0 && count < 200) { // duration for each letter fill
    fill(random(200), 255, 75, 150);
    if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 200 && !mousePressed) { // only draws in top left sector
      text("C", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("C", mouseX, mouseY);
    }
    else { // draws randomly-sized ellipses to decay out old stuff
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 200 && count < 400) {
    fill(random(200), 255, 75, 150);
    if (mouseX > 100 && mouseX < 200 && mouseY > 0 && mouseY < 200 && !mousePressed) {
      text("A", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("A", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 400 && count < 600) {
    fill(random(200), 255, 75, 150);
    if (mouseX > 200 && mouseX < 300 && mouseY > 0 && mouseY < 200 && !mousePressed) {
      text("L", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("L", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 600 && count < 800) {
    fill(random(200), 255, 75, 150);
    if (mouseX > 300 && mouseX < 400 && mouseY > 0 && mouseY < 200 && !mousePressed) {
      text("L", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("L", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 800 && count < 1000) {
    fill(57, random(187), 255);
    if (mouseX > 0 && mouseX < 100 && mouseY > 200 && mouseY < 400 && !mousePressed) {
      text("Y", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("Y", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 1000 && count < 1200) {
    fill(57, random(187), 255);
    if (mouseX > 100 && mouseX < 200 && mouseY > 200 && mouseY < 400 && !mousePressed) {
      text("O", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("O", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 1200 && count < 1400) {
    fill(57, random(187), 255);
    if (mouseX > 200 && mouseX < 300 && mouseY > 200 && mouseY < 400 && !mousePressed) {
      text("U", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("U", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 1400 && count < 1600) {
    fill(57, random(187), 255);
    if (mouseX > 300 && mouseX < 400 && mouseY > 200 && mouseY < 400 && !mousePressed) {
      text("R", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("R", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 1600 && count < 1800) {
    fill(255, 57, random(149));
    if (mouseX > 50 && mouseX < 150 && mouseY > 100 && mouseY < 300 && !mousePressed) {
      text("M", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("M", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 1800 && count < 2000) {
    fill(255, 57, random(149));
    if (mouseX > 150 && mouseX < 250 && mouseY > 100 && mouseY < 300 && !mousePressed) {
      text("U", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("U", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  else if (count >= 2000 && count < 2200) {
    fill(255, 57, random(149));
    if (mouseX > 250 && mouseX < 350 && mouseY > 100 && mouseY < 300 && !mousePressed) {
      text("M", mouseX, mouseY);
    }
    else if (mousePressed) {
      text("M", mouseX, mouseY);
    }
    else {
      rotate(random(PI));
      fill(255, 232, 57, 70);
      noStroke();
      ellipse(random(400), random(400), random(150), random(150));
    }
  }
  
  // reset count so it never causes an overrun error or whatever
  count++;
  if (count>2200) {
    count = 0;
  }
}


