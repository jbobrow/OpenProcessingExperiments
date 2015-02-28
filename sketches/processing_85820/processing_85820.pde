
// Miro Generator
// Devon Scott-Tunkin, DePaul University GAM240 - Playgramming

// Variables for Gradient
int Y_AXIS = 1;
int X_AXIS = 2;
color darkBlue = color(9, 73, 104);
color lightBlue = color(0, 131, 194);

// Used to scale noise map
float increment = 0.02;

void setup() {
  size(800, 600);
  stroke(0);
  fill(0);
  setGradient(0, 0, width, height, darkBlue, lightBlue, Y_AXIS);

  // http://www.processing.org/learning/basics/noise2d.html
  float xoff = 0.0; // Start xoff at 0
  float detail = map(width, 0, width, 0.1, 0.6);
  noiseDetail(8, detail);
  loadPixels(); // need to call this in order to acces pixels[]
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise
      float noiseBrightness = noise(xoff, yoff);
      
      // Store the pixel color
      int p = x + (y * width);     
      color pixelColor = pixels[p];
      
      // Use multiplication for the color blending between the blue and the noise (like Multiply in Photoshop)
      float r = red(pixelColor) * noiseBrightness;
      float g = green(pixelColor) * noiseBrightness;
      float b = blue(pixelColor) * noiseBrightness;
      
      // Draw the pixel color
      strokeWeight(1);
      stroke(r, g, b,50);
      point(x,y);
      
      // If the pixel ends up being very dark, create ellipses.
      if (noiseBrightness < 0.48) {
        stroke(0);
        fill(0, 0, 0, 128);
        noStroke();
        
        // Randomize the size of the ellipses a little bit.
        float ellipseWidth = 12.0 / noiseBrightness * random(0.9, 1.1);
        float ellipseHeight = 8.0 / noiseBrightness * random(0.9, 1.1);
        ellipse(x, y, ellipseWidth, ellipseHeight);
        fill(0, 0, 0, 240);
        
        // If the ellipse falls on a pixel divisible by 10 then draw 4 smaller ellipses off to the side.
        if (y % 10 == 0 && x % 10 == 0) {
          for (int i = 0; i < 4; ++i) {
            float smallEllipseX = random(x - 10, x + 10) + (150 * i);
            float smallEllipseY = random(y - 10, y + 10);
            float smallEllipseWidth = ellipseWidth * random(0.2, 0.4);
            float smallEllipseHeight = ellipseHeight * random(0.2, 0.4);
            ellipse(smallEllipseX, smallEllipseY, smallEllipseWidth, smallEllipseHeight);
          }
        }
      }
    }
  }
  
  // Starting and ending values for orange line are slightly random.
  float lineX = random(0, width);
  float lineY = random(0, height * 0.25);
  float lineX2 = random(lineX - 400, lineX - 100);
  float lineY2 = random(lineY + 300, lineY + 500);
  
  // http://www.openprocessing.org/sketch/44031
  // Draw a jittery orange line.
  stroke(231, 47, 11, 128);
  float xstep = 10;
  float ystep = 10;
  float lastx = lineX;
  float lasty = lineY;
  float y = lineY;
  
  // Draw the orange line by drawing slightly radnomized smaller orange lines every 10 pixels.
  for (float x = lineX; x >= lineX2 && y <= lineY2;) {
    xstep = random(10) - 3;
    strokeWeight(40 + xstep);
    y += ystep;
    x -= xstep;
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }

  // Add a slight blur to the whole screen.
  filter(BLUR, 1);
}

// http://processing.org/learning/basics/lineargradient.html
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
} 



