

PImage img;
int dropSize = 8; //diameter of each paint drop
int paintRadius = 50; //radius of the cursor area
int density = 100; //number of random circles being created each frame
int counter = 0;
boolean erase = true; //erase mode
int eraseSpeed=15; //speed at which old paint is erased

void setup() {
  size(640, 480);
  img = loadImage("bridge.JPG");
  img.resize(640,480);
  img.loadPixels();
   background(0);
}

void draw() {
  
  if (erase ==true) {
  //add an very transparent overlay every 10 frames to fade out old paint
  if (counter % 10 ==0) {
    fill(0,eraseSpeed);
    rect(0,0,width,height); }
   counter++;
  }
  
  //does this whole loop density times, resulting in a number of random circles each frame
  //equal to the number density
  for(int i=0;i<density;i++) {
    
    // Pick a random point within a cirle
    
    //pick a random x value within the circle's diameter
  int tempX = int(random(2*paintRadius)-paintRadius);
    //determine the height of the circle at that x value using the pythagorean theorem
  int circleHeight = round(sqrt(paintRadius*paintRadius-tempX*tempX));
    //pick a random x value within that height
  int tempY = int(random(2*circleHeight))-circleHeight;
    //add mouseX to the x value to make the circle relative to the mouse
    //constrain within the bounds of the window
  int x = constrain(tempX + mouseX, 0, img.width-1);
    //same for y
  int y = constrain(tempY + mouseY, 0, img.height-1);
    //determine the id of the pixel we want using our x and y
  int loc = x + y*img.width;

  // Look up the RGB color in the source image
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,dropSize, dropSize);
  }
}

//if Shift is pressed, change the erase mode to the opposite of the current mode
void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      if (erase == true)
        erase = false;
      else if (erase == false)
        erase = true;
    }
  }
}

