
/*
  Soumya <soumya92@cs.arizona.edu>
  Homework Assignment #3 for ISTA 301
  
  “Splat!”
*/

/* CONFIGURATION VARIABLES */
final int[] SIZE = {800, 500}; // Size of the canvas
final int[] BG = {0, 0, 0}; // Starting background
final int COLORQ = 3; // ‘Quantization’ of colors. How many steps exist while choosing a random color

// State variables
int timeMousePressed = -1; // millis() of last mouse press
int timePressedFor;        // Milliseconds the mouse has been pressed for

int[] currentFill = {0, 0, 0}; // Current fill of the trail {R, G, B}
int mX, mY;                    // Co-ordinates of where the mouse was initially pressed

boolean seenInstructions = false; // Have the instructions been acknowledged?

void setup() {
  
  //size(SIZE[0], SIZE[1]); 
  // HTML5 doesn't like this. So hard coded.
  size(800, 500);
  background(BG[0], BG[1], BG[2]);
  
  colorMode(RGB,255);
  fill(255);
  noStroke();
  
  textFont(createFont("Helvetica", 24, true));
  text("Press and hold the mouse button for a short period of time, then release", 10, 30);
}

void draw() {
  
  // Clear instructions on first click
  if(!seenInstructions && mousePressed) {
    background(BG[0], BG[1], BG[2]);
    seenInstructions = true;
  }
  
  
  if(mousePressed) {
    // If this is the first click
    if(timeMousePressed < 0) {
      // Mark the time the mouse was first pressed
      timeMousePressed = millis();

      // Get a nice fill for the current trail      
      do {
        currentFill[0] = int(random(COLORQ + 1));
        currentFill[1] = int(random(COLORQ + 1));
        currentFill[2] = int(random(COLORQ + 1));
      } while(currentFill[0] + currentFill[1] + currentFill[2] >= COLORQ * 2.75 || currentFill[0] + currentFill[1] + currentFill[2] <= COLORQ * 1.5);
      // ^^^^ This while loop eliminates extra light or extra dark colors
      
      // Mark the position the mouse was pressed at
      mX = mouseX;
      mY = mouseY;
    }
    
    // How long the mouse button was pressed for
    timePressedFor = millis() - timeMousePressed;
    // Set the current color as the fill, with full opacity
    setFill(255);
    // Draw a circle at the mouse position that expands with time
    ellipse(mX, mY, sqrt(timePressedFor*3), sqrt(timePressedFor*3));
    
  } else {
    
    // Released the mouse button?
    if(timeMousePressed > 0) {
      // How long was the mouse button held down?
      timePressedFor = millis() - timeMousePressed;
      // Draw a trail at the current position with appropriate values
      drawTrail(mX, mY, sqrt(timePressedFor*3), timePressedFor);
    }
    
    // Mouse is not being pressed
    timeMousePressed = -1;
  } 
}

// Draws a spiral trail starting at mX, mY with the specified circle size and length
void drawTrail(int mX, int mY, float circleSize, float len) {
  // Get random arc radius between half of length and length
  int rad = int(len / 2 + random(len / 2)); 
  
  // Matrix Transforms!
  pushMatrix();
  // Center canvas at start of trail
  translate(mX, mY);
  // With start as pivot, randomly rotate the canvas
  rotate(radians(random(360)));
  
  // Draw a spiral. Uses cartesian form X = t.cos(t), Y = t.sin(t) of polar eqn r = t
  for(float t = 0; t < len; t += sqrt(len - t)) {
    setFill(255 * pow(1 - t/len, 4));
    ellipse(t * cos(t / rad), t * sin(t / rad), circleSize * (1 - t/len), circleSize * (1 - t/len));
  }
  
  // Reset all matrix transforms
  popMatrix();
  
  // White sheet over the whole canvas to gently fade out older trails
  fill(BG[0], BG[1], BG[2], 10);
  rect(0, 0, SIZE[0], SIZE[1]);
}

// Function for setting the current fill with varying opacities
void setFill(float opacity) {
  fill(currentFill[0] * (255 / COLORQ), currentFill[1] * (255 / COLORQ), currentFill[2] * (255 / COLORQ), opacity);
}
