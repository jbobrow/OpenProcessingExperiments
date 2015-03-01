
 
 // Text on Noisy background.
PFont f;
String message = "Can you read this?";
// An array of Letter objects
Letter[] letters;

void setup (){

  size(300, 300);
  // Load the font
  f = createFont("Tropicali Script BTN Bamboo",43,true);
  textFont(f);
  
  // Create the array the same size as the String
  letters = new Letter[message.length()];
  // Initialize Letters at the correct x location
  int x = 10;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x,100,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }}

void draw (){

  background(255);
  line (0,20,200,300);
stroke (0);
line (0,40,400,300);
stroke (0);
line (0,100, 300, 300);
stroke (0);
line (0, 80, 200, 300);
stroke (0);
line (100, 0, 300,200);
stroke (0);
line (500, 0, 220, 300);
stroke (0);
line (300, 0, 260, 300);
stroke (0);
line (330, 0, 130, 300);
stroke (0);
line (600, 0, 100, 600);
stroke (0);
line (400, 0, 250, 600);
stroke (0);
line (100, 0, 250, 400);
stroke (0);
line (0, 120, 100, 900);
stroke (0);
line (0, 400, 180, 100);
stroke (0);
line (0, 400, 160, 500);
stroke (0);
line (0, 300, 250, 900);
stroke (0);
line(0,400, 300, 500);
stroke(0);
line(100,0,240,400);
stroke(0);
line(100,0,160,400);
stroke(0);
line(150,0,280,400);
stroke(0);
line(225,0,260,400);
stroke(0);
line(425, 0, 270,400);
stroke(0);
line(450,0,180,300);
stroke(0);


  for (int i = 0; i < letters.length; i++) {
    // Display all letters
    letters[i].display();
    
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (mousePressed) {
      letters[i].shake();
    } else {
      letters[i].home();
    }
  }
}

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
  }

  // Display the letter
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter,x,y);
  }

  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }

  // Return the letter home
  void home() {
    x = homex;
    y = homey; 
    
    
  }
}


