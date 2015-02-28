
import org.seltar.Bytes2Web.*;
import processing.pdf.*;

// Made by Christopher Aaby //
//    www.ghostdrome.com    //
//
// List of keyboard shortcuts
// --------------------------
// Space: Creates a new color map
// 0-9:   Sets the opacity. 1 = 10%, 2 = 20%... 0 = 100%
// e,r,t: Sets the scattering of blobs. e = no scattering, r = mild scattering, t = wild scattering
// x:     Switches to painting all black
// z:     Switches to painting with color map
// c:     Clears the canvas to black
// v:     Clears the canvas to white
// b:     Clears the canvas to a random color from the noisemap
// s:     Saves a PNG of the current screen to server and opens the link
// q:     Hides the current color map
// w:     Shows the current color map

PGraphics UI;
PGraphics canvas;

PImage noiseImg; //container for noise image
float pointillize = 16; //Size of circles. Default value is not used.
float mouseDelta = 1; //Diff between current mouse position and mouse position last frame
float mouseDeltaSize = 1; //Test
int mouseDeltaAmount = 1; //Test
int xRandom = 0; //randomised version of x coordinate
int yRandom = 0; //randomised version of y coordinate
int xScatter = 0; //Used at runtime to hold the amount of random scattering on the X axis
int yScatter = 0; //Used at runtime to hold the amount of random scattering on the X axis
int scatterAmount = 0; //Determines the maximum scattering. This is the default, but can be set at runtime with hotkeys.

int opacity = 255; //Used for opacity of painted circles

float rColor = 0.0; //Used to assemble a color
float gColor = 0.0; //...
float bColor = 0.0; //...

float rRandom = random(1); //A random value used to alter color
float gRandom = random(1); //...
float bRandom = random(1); //...

float r = 0;
float g = 0;
float b = 0;

float noiseScale = 0.01; //Determines the fine-grainedness of color map. Higher number = more variation

boolean useColor = true; //Determines whether colormap determines color of dots
boolean showUI = true; //Determines whether the UI is redrawn or not
int willSave = 0; //If 5+, an image will be exported on the next frame

void setup() {
  size(800, 600);
  smooth();
  UI = createGraphics(50, 50, JAVA2D);
  canvas = createGraphics(width, height, JAVA2D);
  noiseImg = createImage(width, height, RGB);
  canvas.beginDraw();
  canvas.smooth();
  canvas.strokeCap(ROUND);
  canvas.background(255);
  canvas.noStroke();
  canvas.endDraw();
  //Making first noise image
  noiseImg.loadPixels();
  for (int x = 0; x < noiseImg.width; x++) {
    for (int y = 0; y < noiseImg.height; y++ ) {
      rColor = noise(sin(x)*noiseScale, cos(y)*noiseScale)*255;
      gColor = noise((x)*noiseScale, (y)*noiseScale)*255*gRandom;
      bColor = noise((x)*noiseScale, (y)*noiseScale)*255*bRandom;
      int loc = x + y*noiseImg.width;
      noiseImg.pixels[loc] = color(rColor, gColor, bColor);
    }
  }
  noiseImg.updatePixels();
  UI.beginDraw();
  UI.image(noiseImg, 0, 0, 50, 50);
  UI.endDraw();
  image(canvas, 0, 0);
  if (showUI) {
    image(UI, width-50, height-50);
  }
}

void draw() {
  canvas.beginDraw();
  //Get location of mouse cursor, and set loc = index of current pixel
  int x = mouseX;
  int y = mouseY;
  int loc = x + y*noiseImg.width;
  // Look up the RGB color in the source image
  mouseDelta = 40 - (abs(pmouseX - mouseX) + abs(pmouseY - mouseY))/2.5;
  //  println(mouseDelta);

  if (mousePressed) {

    mouseDeltaAmount = abs(mouseX - pmouseX) + abs(mouseY - pmouseY);
    if (mouseDeltaAmount <= 6) { //This happens when the mouse is not moving quickly
      mouseDeltaSize += 0.33; //Add size to the "paint blobs"
      if (useColor == true) {
        r = red(noiseImg.pixels[constrain(loc, 0, noiseImg.pixels.length-1)]);
        g = green(noiseImg.pixels[constrain(loc, 0, noiseImg.pixels.length-1)]);
        b = blue(noiseImg.pixels[constrain(loc, 0, noiseImg.pixels.length-1)]);
        // Draw an ellipse at that location with that color
        canvas.fill(r, g, b, opacity);
      }
      if (useColor == false) {
        canvas.fill(0, 0, 0, opacity);
      }
    }
    else { //this happens when the mouse moves quickly
      mouseDeltaSize = 0; //Reset size added to paint blobs
      if (useColor == true) {
        r = red(noiseImg.pixels[constrain(loc, 0, noiseImg.pixels.length-1)]);
        g = green(noiseImg.pixels[constrain(loc, 0, noiseImg.pixels.length-1)]);
        b = blue(noiseImg.pixels[constrain(loc, 0, noiseImg.pixels.length-1)]);
        // Draw an ellipse at that location with that color
        canvas.fill(r, g, b, opacity);
      }
      if (useColor == false) {
        r = 0;
        g = 0;
        b = 0;
        canvas.fill(r, g, b, opacity);
      }
    }
    //    //      This block of code adds lines to the drawing
    //    if (random(1) <= 0.1) {
    //      stroke(r, g, b, opacity);
    //      strokeWeight(10 - constrain(mouseDelta, 1, 8));
    //      line(pmouseX, pmouseY, mouseX, mouseY);
    //      noStroke();
    //    }

    // Draw the circle
    pointillize = constrain(mouseDelta, 2, 40) + constrain(mouseDeltaSize, 0, 30);
    if (scatterAmount != 0) {
      xScatter = (scatterAmount / 2) - floor(random(scatterAmount));
      yScatter = (scatterAmount / 2) - floor(random(scatterAmount));
    }
    if (scatterAmount == 0) {
      xScatter = 0;
      yScatter = 0;
    }
    canvas.ellipse(x + xScatter, y + yScatter, pointillize, pointillize);

    // Draw trails of paint under blobs
    if (random(1) <= 0.2) {
      xRandom = x + xScatter + floor((pointillize / 3.15) - random(pointillize / 3.15));
      yRandom = y + yScatter + floor((pointillize / 3.15) - random(pointillize / 3.15));
      canvas.stroke(r, g, b, opacity);
      canvas.strokeWeight(random(pointillize/4)+1);
      canvas.line(xRandom, yRandom, xRandom, yRandom+random(60+pointillize));
      canvas.noStroke();
    }
  }
  canvas.endDraw();
  image(canvas, 0, 0);
  if (willSave >= 1) {
    willSave += 1;
    if (willSave >= 3) {
      saveToWeb();
      willSave = 0;
    }
  }
  if ((showUI) && (willSave == 0)) {
    image(UI, width-50, height-50);
  }
}


void keyPressed() {
  if (key == 'c') {
    canvas.beginDraw();
    canvas.background(0);
    canvas.endDraw();
    image(canvas, 0, 0);
    //    if (showUI) {
    //      image(UI, width-50, height-50);
    //    }
  }
  if (key == 'v') {
    canvas.beginDraw();
    canvas.background(255);
    canvas.endDraw();
    image(canvas, 0, 0);
    //    if (showUI) {
    //      image(UI, width-50, height-50);
    //    }
  }
  if (key == 'b') {
    int randomLoc = floor(random(width) + random(height)*noiseImg.width);
    r = red(noiseImg.pixels[constrain(randomLoc, 0, noiseImg.pixels.length-1)]);
    g = green(noiseImg.pixels[constrain(randomLoc, 0, noiseImg.pixels.length-1)]);
    b = blue(noiseImg.pixels[constrain(randomLoc, 0, noiseImg.pixels.length-1)]);
    canvas.beginDraw();
    canvas.background(r, g, b);
    canvas.endDraw();
    image(canvas, 0, 0);
    //    if (showUI) {
    //      image(UI, width-50, height-50);
    //    }
  }
  if (key == '1') {
    opacity = floor(255*0.1);
  }
  if (key == '2') {
    opacity = floor(255*0.2);
  }
  if (key == '3') {
    opacity = floor(255*0.3);
  }
  if (key == '4') {
    opacity = floor(255*0.4);
  }
  if (key == '5') {
    opacity = floor(255*0.5);
  }
  if (key == '6') {
    opacity = floor(255*0.6);
  }
  if (key == '7') {
    opacity = floor(255*0.7);
  }
  if (key == '8') {
    opacity = floor(255*0.8);
  }
  if (key == '9') {
    opacity = floor(255*0.9);
  }
  if (key == '0') {
    opacity = 255;
  }
  if (key == 'x') {
    useColor = false;
  }
  if (key == 'z') {
    useColor = true;
  }
  if (key == ' ') {
    noiseSeed(int(random(1000)));
    float rRandom = random(1);
    float gRandom = random(1);
    float bRandom = random(1);
    mouseDelta = 0;

    noiseImg.loadPixels();
    for (int x = 0; x < noiseImg.width; x++) {
      for (int y = 0; y < noiseImg.height; y++ ) {
        rColor = noise(sin(x)*noiseScale, cos(y)*noiseScale)*255*rRandom;
        gColor = noise((x)*noiseScale, (y)*noiseScale)*255*gRandom;
        bColor = noise((x)*noiseScale, (y)*noiseScale)*255*bRandom;
        int loc = x + y*noiseImg.width;
        noiseImg.pixels[loc] = color(rColor, gColor, bColor);
      }
    }
    noiseImg.updatePixels();
    UI.beginDraw();
    UI.image(noiseImg, 0, 0, 50, 50);
    UI.endDraw();
    //    if (showUI) {
    //      image(UI, width-50, height-50);
    //    }
  }
  if (key == 's') {
    //    willSave = 1;
  }
  if (key == 'q') {
    showUI = false;
  }
  if (key == 'w') {
    showUI = true;
  }
  if (key == 'e') {
    scatterAmount = 0;
  }
  if (key == 'r') {
    scatterAmount = 50;
  }
  if (key == 't') {
    scatterAmount = 120;
  }
}

void saveToWeb() {
  image(canvas, 0, 0);
  ImageToWeb savedImage = new ImageToWeb(this);
  savedImage.setType(ImageToWeb.PNG);
  //  savedImage.save("png", true);
  //  savedImage.post("klatMaler", "http://ghostdrome.com/christopheraaby/klatMaler/Upload.php", "klatMaler", true);
  //  if (showUI) {
  //    image(UI, width-50, height-50);
  //  }
}

void mousePressed() {
  mouseDeltaSize = 0;
}


