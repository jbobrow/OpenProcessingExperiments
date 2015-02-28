
//Project 3 ( Final )
//My objective was to create a project the theme of drums
//Imagine you are hitting a drum when you hit a key on the keyboard to draw a line.
//Hit any key between a and z to draw a line.

PImage drum;


void setup() {
  size(1200, 600);
  colorMode(HSB, 366, 150, 150, 200);
  noFill();
  background(#B41010);
  drum = loadImage("drum.jpg");
}


void draw() {

  image(drum, 270, 60);
}


int rectWidth;

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } 
  else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } 
  else { 
    // It's a letter key, fill a rectangle
    fill(millis() % 1);
    float x = map(keyIndex, 0, 255, 600, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
}


//keyinput
void keyReleased() {
  if (key == 's' || key =='S' ) saveFrame("screenshot.png");
}



