
/* @pjs preload="Alex Grey Guitar.jpg"; */ 


PImage img;
int pointillize = 16;

void setup() {
  size(800,647);
  img = loadImage("Alex Grey Guitar.jpg");
  background(255);
  smooth();
  noStroke();
}

void draw() {
  
  
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = (x + y*img.width);
  frameRate(10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000);
 
  // Look up the RGB color in the source image
  
  if(mousePressed == true) { 
    
    stroke(255);
    strokeWeight(3);
   
   line(mouseX, mouseY, pmouseX, pmouseY);

    loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
  
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,1000)^10;
  ellipse(x,y,pointillize,pointillize);
  } else{
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,1000);
  ellipse(x,y,pointillize,pointillize);
  }
}



