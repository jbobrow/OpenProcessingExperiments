

PFont f;
String message = "ONE WEEK AND FIVE DAYS";

// An array of Letter objects
Letter[] letters;

void setup() {
  size(640,360);
  
  // Load the font
  f = createFont("Arial", 20, true);
  textSize(30);
  textFont(f);
  
  // Create the array the same size as the String
  letters = new Letter[message.length()];
  
  // Initialize Letters at the correct x location
  int x = 216;
  for (int i = 0; i < message.length(); i ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters[i] = new Letter(x,180,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}

void draw() {
  background(32, 154, 209);
  for (int i = 0; i < letters.length; i ++ ) {
    
    // Display all letters
    letters[i].display();
    
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (mousePressed) {
      letters[i].shake();
      letters[i].shake();
    } else {
      letters[i].home();
    }
  }
}
// A class to describe a single Letter
class Letter {
  char letter;
  
  // The object knows its original " home " location
  float homex,homey;
  
  // As well as its current location
  float x,y;
  
  Letter(float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }
  
  // Display the letter
  void display() {
    fill(250);
    textAlign(LEFT);
    text(letter,x,y);
  }
  
  // Move the letter randomly
  void shake() {
    x += random(-10,10);
    y += random(-10,10);
  }
  
  // At any point, the current location can be set back to the home location by calling the home() function.
  void home() { 
    x = homex;
    y = homey;
  }
}


