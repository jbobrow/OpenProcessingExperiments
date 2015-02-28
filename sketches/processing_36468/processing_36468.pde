
/**
 * Words. 
 * 
 * The text() function is used for writing words to the screen. 
 */

PFont fontA;
  
void setup() 
{
  size(800, 400);
  background(102);

  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. Use Tools > Create Font 
  // to create a distributable bitmap font. 
  // For vector fonts, use the createFont() function. 
  fontA = loadFont("Courier.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 30);

  // Only draw once
 // noLoop();
}

void draw() {
//  programming  pondered
//  visual perspective thought
//  notation mused
 noStroke();
  for(int x=0;x<width;x+=20) {
    for(int y=0;y<height;y+=20) {
      fill(random(255),100);
      rect(x,y,10+random(4)*10,10+random(4)*10);
    }
  }
  fill(map(mouseX,0,width,0,255));
  textFont(fontA, map(mouseY,0,height,10,40));
  
  text("programming  pondered", 30, 150);
  text("visual perspectives sought", 30, 250);
  text("notations mused", 30, 350);
}

