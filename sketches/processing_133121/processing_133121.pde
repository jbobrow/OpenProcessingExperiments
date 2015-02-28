
import processing.pdf.*; //allows for the creation of pdf files from the processing image.

boolean record;

PFont f;
String message = "we didn’t really speak my summer wants to answer the architecture doesn’t matter this is not my real life when I am here I want to know why do I believe what I was taught a storm is on the way close all the windows begin at the earliest hour is there a self";


int mousebutton = 0;
int wherestart = 0;
int fontype = 0;
// An array of Letter objects
Letter[] letters;

void setup() {
  size(300,300);
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }
  
  // Load the font
  f = createFont("Zapfino-30", 20, true);
  
  textFont(f);
  
  // Create the array the same size as the String
  letters = new Letter[message.length()];
  
  // Initialize Letters at the correct x location
  int x = 16;
  for (int i = 0; i < message.length(); i ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters[i] = new Letter(x,100,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}

void draw() {
  background(255);
  
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }
  
  for (int i = 0; i < letters.length; i ++ ) {
    
    // Display all letters
    letters[i].display();
    
    
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    
   
    
    if (wherestart == 0) {
      letters[i].startingplace();
    }
      
    if (mousePressed) {
      mousebutton= 1;
      wherestart ++;
     
   
    } 
    if (mousebutton == 1) {
 
    letters[i].shake();
    mousebutton = 0;
    }//the shake function created for the array letters is activated when mouse is pressed, but then immediaely is inactivated by mousebutton=0 so each time mouse is pressed the letters only shake once. 
    
    if (keyPressed)
    {
      
      wherestart = 0;
      mousebutton = 0;
  
    }//allows for the startingplace function for the array to go into action, and it 
    
    
    
    }
    
     if (record) {
    endRecord();
  record = false;// stops recording immediately so only one frame is recorded each time mouse is pressed.
  }
  
}

void keyPressed() {
  record = true;
}//allows for the pdf beginrecord function to start because now in the if statement record will be true.

//Huge credits to:  Learning Processing
//Daniel Shiffman
// http://www.learningprocessing.com
//Example 17-6: Text breaking up
//And Procesing PDF Reference: Single Frame from an Animation (With Screen Display)
//The text I used is the poem Autobiography by Kazim Ali
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
    fill(0);
    textAlign(LEFT);
    textFont(f);
    text(letter,x,y);
  }
  
  void startingplace() {
    x = mouseX + random(-50,50);
    y= mouseY+ random(-50, 50);
  }//whenever starting place is used, every letter in the text moved to the mouse position, plus a random number between -50 and 50. Because the random number is being recreated every frame, the letters randomly move within a range from the mouse position.
  
  // Move the letter randomly
  void shake() {
    x += random(-5,5);
    y = (mouseY+(int(random(0,5))*40));
    x = constrain(x,0, width);
    y = constrain(y,0,height);
  }//controls where the letter move when the mouse is pressed. The x value is a random number between negative 5 and 5 which makes it so that it's a radnom distribution of how many letters are in one part of a line. The y= is where the 5 lines are created.
  //Each letter is starting from the mouse postion, and randomly either staying in that position or moving to one of 4 other locations.
  
 
}


