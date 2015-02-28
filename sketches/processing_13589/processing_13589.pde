
/**
 * @author Nicolas Clavaud, 2010
 * largely inspired by Noise2D by Daniel Shiffman
 * http://processing.org/learning/basics/noise2d.html
 */

final float INC = 0.010;  // change this to change resolution
final float SPEED = 3.0;  // speed when moving with keyboard
final int MAPID = 107;    // change this to generate another map
final int NBCOLORS = 5;   // change this to add more color steps

float ddx = 1773;         // starting point
float ddy = 1773;         // 

void setup() {
  noiseSeed(MAPID);       // set up noise using map id
  size(200, 200);
  frameRate(30);
  colorMode(HSB, 255);
}

void draw() {
  controller();           // this will handle controller events
  model();                // this will handle calculation
  view();                 // this will handle drawings
}

void controller() {
  if (mousePressed) {
    ddy -= (mouseX - pmouseX)*INC;  // quick scroll!
    ddx -= (mouseY - pmouseY)*INC;
  }
}

void model() {
}

void view() {
  float dx = 0;
  loadPixels();
  int i = 0;
  for (int x = 0; x < width; x++) {
    dx += INC;
    float dy = 0;
    for (int y = 0; y < height; y++) {
      dy += INC;
      float h = noise(dx + ddx, dy + ddy);  // get some noise
      int b = ceil(h*NBCOLORS)*255/NBCOLORS;
      pixels[i++] = color(140, 220, b);
    }
  }
  updatePixels();
  fill(0);
}

void keyPressed() {
  if (key == 'r') {
    noiseSeed((long) random(9999));  // let's use some random noise
  }
}


