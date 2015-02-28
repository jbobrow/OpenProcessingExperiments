
/*

Discover Color (version 1.0.05) 
Created by Derek Chapman (derekc1990@gmail.com)

--- Sources ---
Processing Language & Reference: http://www.processing.org/
Slider: http://www.sojamo.de/libraries/controlP5/

*/

// Control IP5 Slider Settings
import controlP5.*;

ControlP5 controlP5;
float cH = 50;



void setup() {
  // Controls page size
  size(700, 500);

  // Global Settings
  smooth();
  noStroke();

  // Control IP5 Slider Settings
  controlP5 = new ControlP5(this);
  // add a vertical slider
  controlP5.addSlider("slider", 0, 100, cH, 575, 100, 50, 250);
}


void draw() {
  
  background(50);
  
  // Color H S B
  colorMode(HSB, 100);
  float cS = 0;
  float cB = 100;
  float cBoxSize = 500;

  for (float yCount = 0; yCount < cBoxSize; yCount+=(cBoxSize/100)) {
    for (float xCount = 0; xCount < cBoxSize; xCount+=(cBoxSize/100)) {
      cS += 1;

      fill(cH, cS, cB);
      rect(xCount, yCount, (cBoxSize/100), (cBoxSize/100));
    }
    cS -= 100;
    cB -= 1;
  }
  
  color cStored = get(mouseX, mouseY);
  println("R: " +red(cStored)+ ", G: " +green(cStored)+", B: " +blue(cStored));
  println("H: " +hue(cStored)+ ", S: " +saturation(cStored)+", B: " +brightness(cStored));
}


// Don't touch anything below this line!!! SERIOUSLY GUYS!!!
void mouseClicked() {
  println ("Mouse X Position: "+ mouseX +", Mouse Y Position: " + mouseY);
}

// Control IP5 Slider Code
void slider(float theColor) {
  cH = theColor;
}

/*
void hConverstion(red(cStored),green(cStored), blue(cStored);
*/

