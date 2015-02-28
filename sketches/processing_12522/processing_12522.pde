
//code based on http://www.learningprocessing.com/examples/chapter-9/example-9-8/
// Declare two arrays with 50 elements.
int[] xpos = new int[400]; 
int[] ypos = new int[400];
int r = 255;
int g = 255;
int b = 255;

void setup() {
  size(800,800);
  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}

void draw() {
  background(0);
  display();
}

void display() {
  for (int i = 0; i < xpos.length-1; i ++ ) {
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
    colorMode(HSB, 360, 100, 100);
    ellipseMode(CENTER);
    stroke(255,0);
    fill(1,100,100);
    ellipse(xpos[i],ypos[i],i/10,i/10);  
  }
}

  



