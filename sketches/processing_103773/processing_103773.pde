
private PImage originalImage;
private float splotchSize = 25;

// this gets called once at the very start of our program
public void setup() {
  originalImage = loadImage("dreamliner.jpg");
  size(originalImage.width, originalImage.height);
  noStroke();
  image(originalImage,0,0);
}

public void draw() {
  drawSplotch();
}

// draws a circle at a random location that matches the color of the pixel at that same location in our image
public void drawSplotch(){
  // TODO - pick a random (x, y) position on our image
  
  // TODO - find the color of the pixel at that random position: color pixelColor = originalImage.get(x, y)
  color pixelColor = originalImage.get(mouseX,mouseY);
  // TODO - draw a circle at that random position and give it the same color as the pixel we found (use splotchSize for the radius)
  fill(pixelColor);
  ellipse(mouseX,mouseY,splotchSize,splotchSize);
}
