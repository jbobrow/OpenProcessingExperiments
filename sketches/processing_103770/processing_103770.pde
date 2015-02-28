
private PImage originalImage;
private int splotchSize = 25;
int i = 0;
int j = 0;

// this gets called once at the very start of our program
public void setup() {
  originalImage = loadImage("dreamliner.jpg");
  size(originalImage.width, originalImage.height);
  noStroke();
}

public void draw() {
  //drawRandomSplotch();
 // for(int i = 0; i < 500; i++)
    scanSplotch();
}

// draws a circle at a random location that matches the color of the pixel at that same location in our image
public void drawRandomSplotch(){
  // TODO - pick a random (x, y) position on our image
  int xPos = (int) random(0,1280);
  int yPos = (int) random(0,856);
  // TODO - find the color of the pixel at that random position: color pixelColor = originalImage.get(x, y)
  color pixelColor = originalImage.get(mouseX,mouseY);
  // TODO - draw a circle at that random position and give it the same color as the pixel we found (use splotchSize for the radius)
  fill(pixelColor);
  ellipse(xPos,yPos,splotchSize,splotchSize); 
}

public void scanSplotch(){
  
  // for (initial condition; loop condition; step)

  color pixelColor = originalImage.get(j,i);
  
  fill(pixelColor);
  ellipse(j,i,splotchSize,splotchSize);
  
  j = j +  splotchSize/2;
  if(j>=originalImage.width) {
    j = 0;
    i = i + splotchSize/2;
  }
}
