
// Project 3
// See the documentation for details of the artistic concept.
// The technical details of the program are in each block.


// Global Variable, image variable
PImage splash;


// setup()
void setup(){
size(768,432);
noStroke();
colorMode(RGB,100);
noFill();
splash = loadImage("splash.jpg");
background(splash);
rectMode(CENTER);
}

// draw()
void draw(){
  
 
if(mousePressed){
  
  // Circles generator
  for (int cc=15;cc>1;cc=cc-1) {
    
   
  // I used the technique of sampling of pixels (explained in the examples of processing),  to generate a color palette  
  // Random point x and y
  int x = int(random(splash.width));
  int y = int(random(splash.height));
  // Determined position of the pixel in the array pixels
  int loc = x + y*splash.width;
  
  // Look up the RGB color in the source image (literally)
  loadPixels();
  float r = red(splash.pixels[loc]);
  float g = green(splash.pixels[loc]);
  float b = blue(splash.pixels[loc]);
  
  // Generates a stroke made with random color
  stroke(r,g,b);
  // Draw the circles
  ellipse(mouseX,mouseY,cc+mouseX/10,cc+mouseX/10);      
  }
 
} 
  

} 

// The End



