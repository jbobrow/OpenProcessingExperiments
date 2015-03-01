
float theta = 0.0;

void setup() {
  size(400,200);
  smooth();
}

void draw() {
  background (255);
  // Increment theta (try different values for " angular velocity " here)
  theta += 0.02;
  fill(0);
  float x = theta;

   // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 400; i=i+1) {
    // Calculate y value based off of sine function
    float y = sin(x)*height/2;
    // Draw an ellipse
    line(i*10,y + height/2,i*20,y);
    // Move along x-axis
    x += 0.2;
  }
}
