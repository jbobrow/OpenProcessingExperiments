
float x = 0.0;
PImage blu;
PImage colo;
PImage rea;

void setup() {
  size(930, 700);
  background(0);
  blu = loadImage("blu.JPG");
  colo = loadImage("colo.JPG");
  rea = loadImage("rea.JPG");
  image(blu, 0, 0);

 //blend(trea, 0,0,400,300,0,0,400,300, DARKEST);
}

void draw() {
  background(255);
  image(blu,0,0);
  copy(blu, 0,0,mouseX,mouseY,0,0,mouseX,mouseY);
   //blend(colo, 0,0,400,300,0,0,400,300, DARKEST);
   loadPixels();
   // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < blu.width; x++ ) {
    for (int y = 0; y < blu.height; y++ ) {
      
      // Calculate the 1D pixel location
      int loc = x + y*blu.width;
      
      // Get the R,G,B values from image
      float r = red (blu.pixels[loc]);
      float g = green (blu.pixels[loc]);
      float b = blue (blu.pixels[loc]);
      
      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x,y,mouseX,mouseY);
      
      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // We want closer pixels to be brighter, however, so we invert the value with the formula: adjustBrightness = (50-distance)/50 
      // Pixels with a distance of 50 (or greater) have a brightness of 0.0 (or negative which is equivalent to 0 here)
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = (200-distance)/125;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      
      // Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      
      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  
  updatePixels(); {
    //if (mousePressed); {
    //image(blu,0,0);}
 
   if (mouseX >115 && mouseX<135 && mouseY>385 && mouseY<410) {
     image(colo,0,0);
     copy(colo, 0,0,mouseX,mouseY,0,0,mouseX,mouseY);
   //blend(colo, 0,0,400,300,0,0,400,300, DARKEST);
   loadPixels();
   //if (mousePressed); {
     //image(blu,0,0);}
   // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < colo.width; x++ ) {
    for (int y = 0; y < colo.height; y++ ) {
      
      // Calculate the 1D pixel location
      int loc = x + y*colo.width;
      
      // Get the R,G,B values from image
      float r = red (colo.pixels[loc]);
      float g = green (colo.pixels[loc]);
      float b = blue (colo.pixels[loc]);
      
      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x,y,mouseX,mouseY);
      
      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // We want closer pixels to be brighter, however, so we invert the value with the formula: adjustBrightness = (50-distance)/50 
      // Pixels with a distance of 50 (or greater) have a brightness of 0.0 (or negative which is equivalent to 0 here)
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = (100-distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      
      // Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      
      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
      }
    //filter(INVERT);
     } 
    }
    if (mouseX >530 && mouseX<605 && mouseY>345 && mouseY<560) {
    image(rea,0,0);
     copy(rea, 0,0,mouseX,mouseY,0,0,mouseX,mouseY);
   //blend(colo, 0,0,400,300,0,0,400,300, DARKEST);
   loadPixels();
   // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < rea.width; x++ ) {
    for (int y = 0; y < rea.height; y++ ) {
      
      // Calculate the 1D pixel location
      int loc = x + y*rea.width;
      
      // Get the R,G,B values from image
      float r = red (rea.pixels[loc]);
      float g = green (rea.pixels[loc]);
      float b = blue (rea.pixels[loc]);
      
      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x,y,mouseX,mouseY);
      
      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // We want closer pixels to be brighter, however, so we invert the value with the formula: adjustBrightness = (50-distance)/50 
      // Pixels with a distance of 50 (or greater) have a brightness of 0.0 (or negative which is equivalent to 0 here)
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = (100-distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      
      // Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      
      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
      }
   }
  }
  }
}


