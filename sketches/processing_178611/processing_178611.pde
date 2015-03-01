
PGraphics alphaG;
//Import 'Minin' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample Sound;
//Load audio file from HDD

void setup() {
  size(900, 600); 

  minim = new Minim(this);
  Sound = minim.loadSample("Sleigh bell.mp3");

  // create an extra pgraphics object for rendering on a transparent background
  alphaG = createGraphics(width, height, JAVA2D);
}
//Draw code block (anything goes)
void draw () {
  background(#18375F);
  // draw into the pgraphics object
  alphaG.beginDraw();
  alphaG.fill(#FFFFFF, 0255);
  alphaG.ellipse(random(width), random(height), 12, 12);
  alphaG.fill(#FFFFFF, 255);
  alphaG.ellipse(random(width), random(height), 8, 8); 
  alphaG.fill(#FFFFFF, 0255);
  alphaG.ellipse(random(width), random(height), 5, 5); 
  alphaG.fill(#FFFFFF, 255);
  alphaG.ellipse(random(width), random(height), 3, 3); 

  alphaG.endDraw();
// draw the second renderer into the window, so we can see something 
image(alphaG, 0, 0);
}

//create a key trigger
void keyPressed() {
  if ( key == 'b' ) Sound.trigger();
   save("Project_Snow.png");
}



