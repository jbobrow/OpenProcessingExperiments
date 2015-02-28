
/** SimpleLens 07.03.2012 © by Peter Bosshard Schneider<br />
* SimpleLens lets you examine the pixels of a picture of a part of the central park
* Press 'i' to zoom in and 'o' to zoom out<br />
*/

PFont font;           // the font to display the zoom factor
PImage original;      // original image
PImage sensor;        // pixels examined
PGraphics lens;       // lens buffer
int zoom = 4;         // default zoom
int max_zoom = 64;    // maximal zoom
int min_zoom = 1;     // minimal zoom
int lens_size = 128;  // width and height of the lens
int sensor_size = lens_size/zoom;  // width and height of the sensor
int blocksize = lens_size/sensor_size; // pixel blocksize of the lens

void setup() {
  size(500, 500, JAVA2D);
  background(0);
  original = loadImage("centralpark.jpg");
  lens = createGraphics(lens_size, lens_size, JAVA2D);
  font = loadFont("SansSerif-10.vlw");
  cursor(CROSS);
}

void draw() {
  background(0);
  image(original, 0, 0,500,500);
  noFill();
  noStroke();
  // constrain mouse movement
  int mx = constrain(mouseX,lens_size/2,width-lens_size/2);
  int my = constrain(mouseY,lens_size/2,width-lens_size/2);
  
  // update lens
  sensor_size = lens_size/zoom;
  blocksize = lens_size/sensor_size;
  int zeilen = lens_size/blocksize;
  int spalten = zeilen;
  sensor = createImage(sensor_size, sensor_size, RGB);
  sensor = original.get(mx-(sensor_size/2), my-(sensor_size/2), sensor_size, sensor_size);
  
  // draw buffer graphics
  lens.beginDraw();
  sensor.loadPixels();
  color thecolor;
  for (int zl=0;zl<zeilen;zl++) {
    float ypos = zl*blocksize;
    for (int sp=0;sp<spalten;sp++) {
      float xpos = sp*blocksize;
      int idx = (zl*spalten)+sp;
      if (idx<sensor.pixels.length) {
        thecolor = sensor.pixels[idx];
        lens.fill(thecolor);
        lens.noStroke();
        lens.rectMode(CORNER);
        lens.rect(xpos, ypos, blocksize, blocksize);
      }
    }
  }
  lens.stroke(255);
  lens.noFill();
  lens.rect(0,0,lens_size-1,lens_size-1);
  lens.fill(255);
  lens.textFont(font);
  lens.textAlign(CENTER,CENTER);
  lens.text("x " + zoom, lens.width-20,lens.height-10);
  sensor.updatePixels();
  lens.endDraw();
  image(lens, mx-(lens_size/2), my-(lens_size/2));
}

void keyPressed() {
  if(key == 'i') zoom*=2;              // zoom in
  if(key == 'o') zoom/=2;              // zoom out
  if(zoom > max_zoom) zoom = max_zoom; // constrain zoom range
  if(zoom < min_zoom) zoom = min_zoom; // constrain zoom range
}


