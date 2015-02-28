
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float angle;
PFont font; 

void setup()
{
  size(800, 200);
  background(#325A7D);
  frameRate(10);
  smooth();
  font = loadFont("Verdana-100.vlw"); // load font from Tool->Create Font
}

void draw()
{  
  noStroke();
  fill(#325A7D, 20); // adds halo or transparecy
  rect(0, 0, width, height); 
    
  rotate(random(-1,+1)); // rotate text random
  fill(255);
  textSize(random(300));
  textAlign(CENTER, CENTER);
  text("SOS", random(width), random(height));
}

