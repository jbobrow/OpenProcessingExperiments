
PImage face, blink, eyeLeft, eyeRight, eyebrows, reflections;
PImage[] newEyebrows;

float eyeLeftX, eyeLeftY, eyeRightX, eyeRightY;
float eyebrowYDown, eyebrowY = 0;
float eyebrowScew = 15, eyebrowScewDown;

int blinkLength = 5, blinkNum = 0;

float mouseDownX, mouseDownY;

void setup(){
  // Load Images
  face = loadImage("face.png");
  blink = loadImage("blink.png");
  eyeLeft = loadImage("eye-left.png");
  eyeRight = loadImage("eye-left.png");
  eyebrows = loadImage("eyebrows.png");
  reflections = loadImage("reflections.png");
  
  newEyebrows = new PImage[30];
  
  // Create an Array of Scewed Eyebrows
  for(int s = 0; s < 30; s++){
    newEyebrows[s] = warpEyebrows(eyebrows, s);
  }
  
  // Setup Canvas
  //size(face.width, face.height);
  size(720, 277);
  frameRate(60);
  noCursor();
}

void draw(){
  background(255);
  
  if(mousePressed){
    // Drag Eyebrows
    eyebrowY = eyebrowYDown + (mouseY - mouseDownY);
    // Scew Eyebrows
    eyebrowScew = eyebrowScewDown + (mouseX - mouseDownX)*0.1;
    // Constrain Eyebrows
    eyebrowScew = constrain(eyebrowScew, 0, 29);
    // NEED TO CONSTRAIN ACCORDING TO EYEBROW SCEW!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    eyebrowY = constrain(eyebrowY, -40+eyebrowScew, 15+eyebrowScew);
    // Generate New Eyebrows
    //newEyebrows = warpEyebrows(eyebrows);
  } else {
    // Look Left & Right
    eyeLeftX = map(mouseX, 0, width, -20, 25);
    eyeRightX = map(mouseX, 0, width, -25, 20);
    // Look Up & Down
    eyeLeftY = map(mouseY, 0, height, -10, 10);
    eyeRightY = eyeLeftY;
    
    // Eyebrows Look Up & Down
    //eyebrowY += map(mouseY, 0, height, -5, 5);
  }
  
  // Draw Eyes
  image(eyeLeft, eyeLeftX, eyeLeftY);
  image(eyeRight, eyeRightX + 285, eyeRightY);
  
  // Random Blinking
  // 50% Chance of Blinking Every 120 Frames (2 Seconds)
  if(frameCount%120 == 0 && random(10) > 5){
    // Set Length of Blink
    blinkNum = blinkLength;
  }
  
  // Draw Face
  image(reflections, 0, 0);
  if(blinkNum > 0){
    // Draw Blink
    blinkNum -= 1;
    image(blink, 0, 0);
  } else {
    // Draw Regular Face
    image(face, 0, 0);
  }
  image(newEyebrows[29-(int)eyebrowScew], 0, eyebrowY);
}

void mousePressed(){
  // Get Eyebrow Position
  eyebrowYDown = eyebrowY;
  // Get Eyebrow Scew
  eyebrowScewDown = eyebrowScew;
  // Get Mouse Position
  mouseDownX = mouseX;
  mouseDownY = mouseY;
}

PImage warpEyebrows(PImage source, int scewNum){
  
  // Get Original Image Dimensions
  int w = source.width, h = source.height;
  // Declare New PImage
  PImage destination = new PImage(w, h, ARGB);
  // Get Pixels
  source.loadPixels();
  destination.loadPixels();
  
  // For Pixels In Width
  for(int x = 0; x < w; x++){
    // For Pixels In Height
    for(int y = 0; y < h; y++){
     
      int newX, newY;
      newX = x;
      // Get New Y Position From Eyebrow Scew
      newY = (int)(y+abs(x - w/2) * (0.15-(float)scewNum/100));
      
      color c;
      
      // If Out of Bounds Set Color to Transparent
      if(newX >= w || newX < 0 ||
      newY >= h || newY < 0){
        c = color(0, 0);
      } else {
        // Get New Pixel
        c = source.pixels[newY*w + newX];
      }
      // Apply New Pixel
      destination.pixels[y*w+x] = c;
      
    } 
  }
  // Return Warped Image
  return destination;
}



