
// Starting angle
float theta = 0.0;

void setup() {
  size(800,600);
  smooth();
   frameRate(100); 
}

void draw() {
  background(200);
   line(pmouseX, pmouseY, mouseX, mouseY);
   color (0);
  
  // Increment theta (try different values for " angular velocity " here)
  theta += 0.02;
  noStroke();
  fill(10);
  float x = theta;
  
   // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 100; i++) {
    // Calculate y value based off of sine function
    float y = sin(x)*height/3;
    // Draw an ellipse
    ellipse(i*8,y + height/2,5,5);
    // Move along x-axis
    x += 200;
  }
   // Increment theta (try different values for " angular velocity " here)
  theta += 0.02;
  noStroke();
  fill(0);
  float y = theta;
  
   // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 100; i++)
  for (int e = 0; e <= 100; e++)
   {
    // Calculate y value based off of sine function
 // Draw an ellipse
    ellipse(i*100,y + height/2,10,10);
    // Move along x-axis
    x += 200;
  }
   
}
 

