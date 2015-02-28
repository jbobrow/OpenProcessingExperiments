
// Strings are a kind of objects (just like PImage, PFont or the classes
// we have been writing) that allow us to store entire strings of characters
String message = "The quick brown fox jumps over the lazy dog";

void setup() {
  size(300, 300);  
}

void draw() {
  background(255);
  fill(0); 
  
  text(message, mouseX, mouseY);
  
  // You can also specify a bounding box for your text
  // by adding a 'width' and 'height' after the position
  // Processing will "do its best" to fit the text in the box
  // but it's usually not perfect 
  /*
  text(message, mouseX, mouseY, 100, 100);
  noFill();
  rect(mouseX, mouseY, 100, 100);
  */
}


