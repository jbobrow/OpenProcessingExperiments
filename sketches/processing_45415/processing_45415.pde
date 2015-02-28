
/*

 Discover Color (version 1.0.06) 
 Created by Derek Chapman (derekc1990@gmail.com)
 
 --- Sources ---
 Processing Language & Reference: http://www.processing.org/
 Slider: http://www.sojamo.de/libraries/controlP5/
 
 */

// Control IP5 Slider Settings
import controlP5.*;

ControlP5 controlP5;
float cH = 50;

// Setting Hue Color Bar Variables
PImage hueBar;
int[] hueBarPos = {
  575, 100
};

// Defining Color Map (Size, X, Y)
int[] colorMap = {
  500, 10, 10
};

// Setting variable to store color at mouse pointer
color cStored;

// Setting Custom Typefaces
PFont dinMedium;



void setup() {
  // Controls page size
  size(700, 900);

  // Global Settings
  smooth();
  noStroke();

  // Loading Hue Color Bar
  hueBar = loadImage("colorbar.jpg");

  // Loading Custom Fonts
  dinMedium = loadFont("DIN-Medium-48.vlw");

  // Control IP5 Slider Settings
  controlP5 = new ControlP5(this);
  // add a vertical slider
  Slider s = controlP5.addSlider("slider", 0, 100, cH, hueBarPos[0], hueBarPos[1], 50, 250);
  s.setLabelVisible(false);
  s.setColorBackground(101);
  s.setSliderMode(Slider.FLEXIBLE);
  s.setColorActive(25);
  s.setColorForeground(100);
}


void draw() {

  background(50);
  image(hueBar, hueBarPos[0], hueBarPos[1]);

  // Setting Color Mode to HSB
  colorMode(HSB, 100);

  // Creating HSB Variables
  float cS = 0;
  float cB = 100;

  // Drawing Color Map
  for (float colorMapYCount = 0; colorMapYCount < colorMap[0]; colorMapYCount+=(colorMap[0]/100)) {
    for (float colorMapXCount = 0; colorMapXCount < colorMap[0]; colorMapXCount+=(colorMap[0]/100)) {
      cS += 1;

      fill(cH, cS, cB);
      rect(colorMapXCount+colorMap[1], colorMapYCount+colorMap[2], (colorMap[0]/100), (colorMap[0]/100));
    }
    cS -= 100;
    cB -= 1;
  }


  // Display Text
  textFont(dinMedium, 14);
  if (mouseX > colorMap[1] && mouseX < colorMap[1]+colorMap[0] && mouseY > colorMap[2] && mouseY < colorMap[2]+colorMap[0]) {
    cStored = get(mouseX, mouseY);
  }
  text("R: " +red(cStored)+ ", G: " +green(cStored)+", B: " +blue(cStored), 20, 530);
  text("H: " +hue(cStored)+ ", S: " +saturation(cStored)+", B: " +brightness(cStored), 20, 555);
  text("Hex Code: " +hex(cStored, 6), 20, 580);
}


// Mouse Cordinates on Click
void mouseClicked() {
  println ("Mouse X Position: "+ mouseX +", Mouse Y Position: " + mouseY);
}

// Control IP5 Slider Code
void slider(float theColor) {
  cH = theColor;
}


