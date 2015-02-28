
// each character has an 'ascii' code which represents it
// in other words, 'char' variables are really just numbers
// for instance, 'A' is the number 65. 

// this program will draw the character pressed, and it's
// corresponding ASCII code on the right 

void setup() {
  size(400, 200);
  textAlign(CENTER, BASELINE);
  textSize(100); // in pixels 
  fill(0); // fill changes the text color
}

void draw() {      
  if (key != CODED) {  
    background(255);
    
    // center (x,y) point for the left hand-side
    float x = width/4;
    float y = height/2;

    stroke(128);
    line(width/2, 0, width/2, height);
    
    // shift "y" a little bit to center the text a little better
    text(key, x, y+35); 
  
    // move "x" by half the width so we end up centered
    // in the second half
    x += width/2;
    // if we explicity convert key (which is a char) into an int
    // we get the ascii code!
    text(int(key), x, y+35);  
  }
}



