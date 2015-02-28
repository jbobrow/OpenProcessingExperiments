
// An array of news headlines
String[] headlines = {
  "Hello Meggy." ,
  "How the flip are you?" ,
   "Terrific.",
   "Sweet lime, You are the most beautiful",
   "I love you!",
   "MWA MWA"
};

PFont f; // Global font variable
float x; // Horizontal location
int index = 0;

void setup() {
  size(640,360);
  f = loadFont("LetterGothicStd-48.vlw");
  
  // Initialize headline offscreen
  x = width;
}

void draw() {
  background(random(150,255));
  fill(random(100));
  stroke(12);
  
  // Display headline at x location
  textFont(f,16);
  textAlign (LEFT);
  
  // A specific String from the array is displayed according to the value of the "index" variable.
  text(headlines[index],x,random(height)); 
  
  // Decrement x
  x = x - 3;
  
  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  float w = textWidth(headlines[index]); 
  if (x < -w) {
    x = width;
    // index is incremented when the current String has left the screen in order to display a new String.
    index = (index + 1) % headlines.length; 
  }
}


