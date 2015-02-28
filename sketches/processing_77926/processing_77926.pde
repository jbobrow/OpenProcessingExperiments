


// THIS IS BASDED on the "snake" array example from our textbook, from Chapter 9 "Arrays"
// Declare some arrays.
int arraySize = 60;

int[] xpos = new int[arraySize]; 
int[] ypos = new int[arraySize];
char[] chars = new char[arraySize];

void setup() {
  size(500, 500);
  
  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) 
  {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  
  // Create the font
  textFont(createFont("Helvetica", 80));
  
  // fill the char array
  for (int i = 0; i < chars.length; i ++ ) 
  {
    chars[i] = char(i + 65);
  }
}

void draw() {
  background(255);
  
  // Shift array values
  for (int i = 0; i < xpos.length-1; i ++ ) 
  {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // New location
  xpos[xpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(255 - i * (255./(float) arraySize));
    text(chars[i], xpos[i],ypos[i]);
  }
}


