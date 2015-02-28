
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs font="Georgia.ttf"; */

char letter;
String words = "Type Now:";

void setup() {
  size(640, 360);
  // Create the font
  textFont(createFont("Helvetica", 36));
}

void draw() {
  background(127.5, 0, 0); // Set background to black

  // Draw the letter to the center of the screen
  textSize(14);
  text("Click on the program, then type to add to the string", 50, 50);
  text("Current key: " + letter, 50, 70);
  text("The String is " + words.length() +  " characters long", 50, 90);
  text("The string is shown in ASCII on the screen.", 50, 110);
  
  textSize(36);
  text(words, 50, 120, 540, 300);
}

void keyPressed() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    letter = key;
    words = words + key;
    // Write the letter to the console
    println(key);
  }
}
