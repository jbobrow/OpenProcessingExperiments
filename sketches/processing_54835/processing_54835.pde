
//sets variable for font
PFont f;

//sets the base
void setup() {
  //size of the screen
  size(400, 400);
  //sets background colour to black
  background(0);
  //draws all text in smooth edges
  smooth();
  //loads font in Helvetica
  f = createFont ("Helvetica", random(12), true);
}

//creates animation
void draw() {
}

//sets settings for when the mouse cursor is moved
void mouseMoved() {
  //when the cursor is moved, it'll load the text in ramdom font sizes within 0 to 120pt
  textFont(f, random(120));  
  //the text will say the cursor's value at x, and the text will follow the mouse's value at x and y
  text(mouseX, mouseX, mouseY);
  //when left to right, the text colour will be in random colour of G value (more value in blue), at random opacity within 170
  if (mouseX>pmouseX) {
    fill(0, random(200), 167, random(170));
  }
  //when right to left, the text colour will be in random colour of G value (more value in red), at random opacity within 170
  else if (mouseX<pmouseX) {
    fill(239, random(255), 51, random(170));
  }
  //when up to down, the text colour will be in random colour of B value (close to yellow colour), at random opacity within 170
  else if (mouseY>pmouseY) {
    fill(255, 214, random(255), random(170));
  }
  //when down to up, the text colour will be in random colour of B value (close to magenta colour), at random opacity within 170
  else if (mouseY<pmouseY) {
    fill(243, 21, random(255), random(170));
  }
}

//sets settings for when clicked
void mousePressed() {
  //when clicked with right button, it'll clear the screen and change the colour of the background to a random dark colour
  if (mouseButton == RIGHT) {
    background(random(70),random(70),random(70));
  } 
  //when clicked with left button, the text colour will be white
  else if (mouseButton == LEFT) {
    fill(255);
  }
}

