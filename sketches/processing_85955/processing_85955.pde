
// An array of news headlines
String[] headlines = {
  "Scroll!", 
  "Look! It's scrolling!",
  };

PFont f;  // Global font variable
float x;  // horizontal location of headline
int index = 0;

void setup() {
  size(400,200);
  f = createFont("Jokerman",72,true);  
  // Initialize headline offscreen to the right 
  x = width; 
}

void draw() {
  background(255);
  fill(4);

  // Display headline at x  location
  textFont(f,16);        
  textAlign(LEFT);
  text(headlines[index],x,180); 

  // Decrement x
  x = x - 3;

  // If x is less than the negative width, 
  // then it is off the screen
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width; 
    index = (index + 1) % headlines.length;
  }
}
