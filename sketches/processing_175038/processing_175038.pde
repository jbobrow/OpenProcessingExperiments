
PGraphics alphaG;

void setup() {
  size(900, 600); 
  // create an extra pgraphics object for rendering on a transparent background
  alphaG = createGraphics(width, height, JAVA2D);

  // background will be transparent in the png-file 
  background(0);
}

void draw() {

  // draw into the pgraphics object
  alphaG.beginDraw();
  alphaG.fill(#FFE600, 0255);
  alphaG.ellipse(random(width), random(height), 55, 55);
  alphaG.fill(#0070FF, 0255);
  alphaG.ellipse(random(width), random(height), 90, 90); 
  alphaG.fill(#FF00F3, 0255);
  alphaG.ellipse(random(width), random(height), 70, 70); 
  alphaG.fill(#000000, 0255);
  alphaG.ellipse(random(width), random(height), 100, 100); 

  alphaG.endDraw();

  // draw the second renderer into the window, so we can see something 
  image(alphaG, 0, 0);
  save("colour.png");
}



