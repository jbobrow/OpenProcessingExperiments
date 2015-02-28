
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// http://www.openprocessing.org/sketch/46746

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;
  // And an angle of rotation
  float theta;


  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    x = random(width);
    y = random(height);
    theta = random(TWO_PI);
    letter = letter_; 
  }

  // Display the letter
  void display() {
    fill(#91AA9D);
    textAlign(LEFT);
    // User translate and rotate to draw the letter
    pushMatrix();
    translate(x,y);
    rotate(theta);
    text(letter,0,0);
    popMatrix();
  }

  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
    theta += random(-0.5,0.5);
  }

  // Return the letter home using lerp!
  void home() {
    x = lerp(x,homex,0.05);
    y = lerp(y,homey,0.05);
    theta = lerp(theta,0,0.05);
  }
}
PImage img;
String message = "Shake Shake";
PFont font;

Letter[] letters;

void setup() {
  
  size(450,450);
  font = createFont("Baskerville-Bold", 55);
  textFont(font);


  img = loadImage("shake1.jpg");
  letters = new Letter[message.length()];
  int x = 50;
  for (int i = 0; i < message.length(); i++) {
  letters[i] = new Letter(x,height/2,message.charAt(i)); 
  x += textWidth(message.charAt(i));
  }
  
 
  
}

void draw() {
  image(img,0,0);

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

