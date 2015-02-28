
/**
 * This sketch is based on the Color Cube example by Christopher Wolfram
 * http://demonstrations.wolfram.com/ColorCube/
 *
 * It also takes advantage of the Tiny GUI by Christopher Guebert:
 * http://openprocessing.org/visuals/?visualID=10416
 * 
 * Felix Woitzel, November 2010
 */

MinyGUI gui;
MinyFloat d;

PFont font;

void setup(){
  size(512,512,P3D);
  
  font = createFont("Arial",19);
  textFont(font);
  
  d = new MinyFloat(0.5);
  gui = new MinyGUI(0,0,width/2,50);
  gui.addSlider("distance", d, 0.0, 1.0);
  
  gui.fg = color(255);
  gui.bg = color(96);
  gui.selectColor = color(128);
}

float distance = 1;
float frameSize = 256;
float boxSize = 32;

void draw(){
  background(64); // a dark gray background
  lights();  // yes the cube are enlighted, haha
  stroke(color(0)); // the framing box has only outlines
  noFill();  // no surface
  pushMatrix(); // push the overall image centering
  translate(width/2,height/2);
  box(256); // draw the framing box outlines
  
  // each of the 8 cubes is moved along a different axis depending on the global variable 'distance'
  // altogether in the middle at distance == 0
  // boxes at the corners at distance == 1
  distance = d.getValue(); // grab value from GUI element
  float minDistance = boxSize/2;
  float maxDistance = frameSize/2 - boxSize/2;
  float translation = lerp(minDistance,maxDistance,distance); // lerp does a linear interpolation
  
  // upper left front cube
  fill(color(255,128,128)); // pink
  pushMatrix(); // individual translation
  translate(-translation,-translation,translation); // up left front axis
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering
  
  // upper right front cube
  fill(color(64,0,128)); // dark purple
  pushMatrix(); // individual translation
  translate(translation,-translation,translation); // up right front axis
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  // lower right front cube
  fill(color(128,128,255)); // light blue
  pushMatrix(); // individual translation
  translate(translation,translation,translation); // analogous, get it? :)
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  // lower left front cube
  fill(color(0,255,0)); // green
  pushMatrix(); // individual translation
  translate(-translation,translation,translation); // analogous, get it? :)
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  // lower left back cube
  fill(color(255,128,0)); // orange
  pushMatrix(); // individual translation
  translate(-translation,translation,-translation); // analogous, get it? :)
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  // upper right back cube
  fill(color(255,255,0)); // yellow
  pushMatrix(); // individual translation
  translate(translation,-translation,-translation); // analogous, get it? :)
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  // upper left back cube
  fill(color(0,0,255)); // blue
  pushMatrix(); // individual translation
  translate(-translation,-translation,-translation); // analogous, get it? :)
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  // lower right back cube
  fill(color(255,0,0)); // red
  pushMatrix(); // individual translation
  translate(translation,translation,-translation); // analogous, get it? :)
  box(boxSize);
  popMatrix(); // release individual translation, return to global image centering

  popMatrix(); // release image centering
  
  gui.display();
  
}

