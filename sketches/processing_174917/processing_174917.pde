
void setup() {
  size(900, 600);
  noStroke();
  background(0);
}

/** Mouse Input.
 */
int angle = 0;
void draw() {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 25;
    float val = cos(radians(angle)) * 25.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(130, 0, 130, 0255);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }

    fill(255, 100, 0, 0255);
    ellipse(mouseX, mouseY, 2, 2);

    // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0

    float sd = 35;                  // Define a standard deviation
    float mean = width/2;           // Define a mean value (middle of the screen along the x-axis)
    float x = ( val * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean

      noStroke();
    fill(255, 20);
    noStroke();

    ellipse(x, height/2, 52, 52);   // Draw an ellipse at our "normal" random location

    // draw the second renderer into the window, so we can see something 
    save("flower1.png");
  }
}



