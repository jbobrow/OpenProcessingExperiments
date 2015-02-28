
/* Press SPACE to switch between lines, multi-colored squiggles, and halftone
 * Press <- or -> to change the image being viewed.
 *
 * This uses a halftone algorithm to draw the image in black and white halftone.
 * However, I modified that so it doesn't draw dots but tiny squiggles consisting of
 * rgb colors. It seems to work best with grayscale photos, the color can be too
 * dark with color images, but the fix for that would involve ORing each color path
 * which can be very costly.
 * After deciding that squiggles didn't look so great, I decided to add yet another mode
 * to do edge detection and draw lines at a randomized jitter in the direction of the edge.
 * This actually looks pretty cool, especially since I managed to get the color away from
 * RGB and into CMY which is much more visually appealing since they are the primary
 * subtractive colors that we're used to seeing combine in this way in real paintings.
 *
 * WARNING:
 * This program is SLOW, even in processing. It takes a while to switch between
 * images because a new set of values must be calculated for each sample space in the image.
 * The squiggles are also supposed to be dynamic, but it takes too long to draw them so they
 * move slower than what I was hoping for.
 */

// Drawing constants
final static int LINE     = 0;
final static int SQUIGGLE = 1;
final static int DOT      = 2;

// Names of the images to load
final static String[] IMAGE_NAMES = {"Monroe_Portrait.jpg", "monalisa.jpg", "starrynight.jpg"};

// Constants used to calculate the size of each halftone dot
final static int SAMPLE_SIZE = 5;
final static float MIN_DOT_SIZE = 2;
final static float DOT_RATIO = 3;

// Array of images we're using
PImage[] images;
int imgIndex = 0;

// Stores the color of each sample from the image
color[][] halftoneColors1;
color[][] halftoneColors2;

// Stores for the intensities (opposite of brightness)
// of each sample of from the image
float[][] halftoneIntensities1;
float[][] halftoneIntensities2;

// Stores the angles for the grid
float[][] halftoneAnglesR1;
float[][] halftoneAnglesG1;
float[][] halftoneAnglesB1;
float[][] halftoneAnglesR2;
float[][] halftoneAnglesG2;
float[][] halftoneAnglesB2;

// Temporary arrays to store information in during the loading transistion
color[][] hColors1;
color[][] hColors2;
float[][] hIntensities1;
float[][] hIntensities2;
float[][] hAnglesR1;
float[][] hAnglesG1;
float[][] hAnglesB1;
float[][] hAnglesR2;
float[][] hAnglesG2;
float[][] hAnglesB2;

// Defines whether we're drawing squiggles or halftones or lines
int type = LINE;

// Dtermines if we're currently loading a new image
boolean loading;
boolean wereLoading;

void setup() {
  size(400, 400, P2D);
  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  
  // Load all the images we will be using
  images = new PImage[IMAGE_NAMES.length];
  for(int i=0; i<IMAGE_NAMES.length; i++) {
    images[i] = loadImage(IMAGE_NAMES[i]);
  }
  
  load();
  wereLoading = true;
}

void draw() {
  if(!loading && wereLoading) {
    halftoneColors1 = hColors1;
    halftoneColors2 = hColors2;
    halftoneIntensities1 = hIntensities1;
    halftoneIntensities2 = hIntensities2;
    halftoneAnglesR1 = hAnglesR1;
    halftoneAnglesG1 = hAnglesG1;
    halftoneAnglesB1 = hAnglesB1;
    halftoneAnglesR2 = hAnglesR2;
    halftoneAnglesG2 = hAnglesG2;
    halftoneAnglesB2 = hAnglesB2;
  }

  if(loading) {
    fill(0x33000000);
    rect(0, 0, width, height);
    wereLoading = true;
  } else {
    color c;
    float intensity;
  
    if(type==SQUIGGLE) drawAllSquiggles();
    else if(type==DOT) drawAllDots();
    else if(type==LINE) drawAllLines();
  }
}


//------------------ Dot Drawing Methods ---------------------------------

// Draws halftone dots for entire image
void drawAllDots() {
  background(255);
  for(int y=0; y<halftoneIntensities1.length; y++) {
    for(int x=0; x<halftoneIntensities1[0].length; x++) {
      drawDot(x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE, y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE, halftoneIntensities1[x][y]);
      drawDot(x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE, y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE, halftoneIntensities2[x][y]);
    }
  }
}

// Draws a black dot with center x and y and width defined by intensity
void drawDot(float x, float y, float intensity) {
  noStroke();
  fill(0);
  ellipse(x, y, intensity, intensity);
}


//------------------------- Squiggle Drawing Methods -------------------------

// Draws squiggles for entire image
void drawAllSquiggles() {
  background(255);
  color c;
  float intensity;
  
  for(int y=0; y<halftoneIntensities1.length; y++) {
    for(int x=0; x<halftoneIntensities1[0].length; x++) {
        c = halftoneColors1[x][y];
        intensity = halftoneIntensities1[x][y];
        drawSquiggles(color(red(c), 0, 0, 255-brightness(c)),
                      x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      intensity, SAMPLE_SIZE);
        drawSquiggles(color(0, green(c), 0, 255-brightness(c)),
                      x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      intensity, SAMPLE_SIZE);
        drawSquiggles(color(0, 0, blue(c), 255-brightness(c)),
                      x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      intensity, SAMPLE_SIZE);
                      
        c = halftoneColors2[x][y];
        intensity = halftoneIntensities2[x][y];
        drawSquiggles(color(red(c), 0, 0, 255-brightness(c)),
                      x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      intensity, SAMPLE_SIZE);
        drawSquiggles(color(0, green(c), 0, 255-brightness(c)),
                      x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      intensity, SAMPLE_SIZE);
        drawSquiggles(color(0, 0, blue(c), 255-brightness(c)),
                      x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      intensity, SAMPLE_SIZE);
    }
  }
}

// Draws squiggles of color c at with center point x and y within the width and height bounds given.
// The number of squiggles drawn is defined by intensity
void drawSquiggles(color c, float x, float y, float intensity, int bounds) {
  stroke(c);
  noFill();
  beginShape();
  for(int i=0; i<intensity/3+2; i++) {
    vertex(random(x-bounds, x+bounds), random(y-bounds, y+bounds));
  }
  endShape();
}


//----------------------------------- Line Drawing Methods ---------------------------

// Draws lines for entire image
void drawAllLines() {
  color c;
  
  for(int y=0; y<halftoneIntensities1.length; y++) {
    for(int x=0; x<halftoneIntensities1[0].length; x++) {
        c = halftoneColors1[x][y];
        drawLines(x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      color(red(c), brightness(c), brightness(c)),
                      halftoneAnglesR1[x][y],
                      SAMPLE_SIZE);
        drawLines(x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      color(brightness(c), green(c), brightness(c)),
                      halftoneAnglesG1[x][y],
                      SAMPLE_SIZE);
        drawLines(x*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 0.5*SAMPLE_SIZE,
                      color(brightness(c), brightness(c), blue(c)),
                      halftoneAnglesB1[x][y],
                      SAMPLE_SIZE);
                      
        c = halftoneColors2[x][y];
        drawLines(x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      color(red(c), brightness(c), brightness(c)),
                      halftoneAnglesR2[x][y],
                      SAMPLE_SIZE);
        drawLines(x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      color(brightness(c), green(c), brightness(c)),
                      halftoneAnglesG2[x][y],
                      SAMPLE_SIZE);
        drawLines(x*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      y*SAMPLE_SIZE*2 + 1.5*SAMPLE_SIZE,
                      color(brightness(c), brightness(c), blue(c)),
                      halftoneAnglesB2[x][y],
                      SAMPLE_SIZE);
    }
  }
}

void drawLines(float x, float y, color c, float angle, int bounds) {
  stroke(c);
  
  float dx = cos(angle) * bounds;
  float dy = sin(angle) * bounds;

  // We can gitter the positions of the lines slightly to
  // get a nice dynamic randomized movement
  float jitterx = random(-bounds, bounds);
  float jittery = random(-bounds, bounds);
  line(x+jitterx, y+jittery, x-dx+jitterx, y-dy+jittery);
}


//----------------------- Image Loading Methods ----------------------------------------------

// loads the current image and pre-calculates the color and intensities and angles of each sample space
// This method is called every time a new image is viewed

void load() {
  background(255);
  loading = true;
  
  PImage currImg = images[imgIndex];
  
  hColors1 = new color[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hColors2 = new color[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  
  hIntensities1 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hIntensities2 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  
  hAnglesR1 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hAnglesG1 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hAnglesB1 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hAnglesR2 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hAnglesG2 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  hAnglesB2 = new float[currImg.width/SAMPLE_SIZE/2][currImg.height/SAMPLE_SIZE/2];
  
  // Stores for horixontal and vertical angles
  float anglesR[][] = new float[currImg.width][currImg.height];
  float anglesG[][] = new float[currImg.width][currImg.height];
  float anglesB[][] = new float[currImg.width][currImg.height];

  getImgAngles(currImg, anglesR, anglesG, anglesB);

  color c;
  for(int y=0; y<currImg.height; y+=SAMPLE_SIZE*2) {
    for(int x=0; x<currImg.width; x+=SAMPLE_SIZE*2) {
      c = findAverage(currImg, x, y, SAMPLE_SIZE);
      hColors1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2] = c;      
      hIntensities1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = (255 - brightness(c))/255*SAMPLE_SIZE*DOT_RATIO + MIN_DOT_SIZE;
      hAnglesR1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = findAverage(anglesR, x, y, SAMPLE_SIZE);
      hAnglesG1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = findAverage(anglesG, x, y, SAMPLE_SIZE);
      hAnglesB1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = findAverage(anglesB, x, y, SAMPLE_SIZE);
      
      c = findAverage(currImg, x+SAMPLE_SIZE, y+SAMPLE_SIZE, SAMPLE_SIZE);
      hColors2[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2] = c;
      hIntensities2[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = (255 - brightness(c))/255*SAMPLE_SIZE*DOT_RATIO + MIN_DOT_SIZE;
      hAnglesR1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = findAverage(anglesR, x+SAMPLE_SIZE, y+SAMPLE_SIZE, SAMPLE_SIZE);
      hAnglesG1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = findAverage(anglesG, x+SAMPLE_SIZE, y+SAMPLE_SIZE, SAMPLE_SIZE);
      hAnglesB1[x/SAMPLE_SIZE/2][y/SAMPLE_SIZE/2]
        = findAverage(anglesB, x+SAMPLE_SIZE, y+SAMPLE_SIZE, SAMPLE_SIZE);
    }
  }
    
  loading = false;
}

void getImgAngles(PImage img, float[][] anglesR, float[][] anglesG, float[][] anglesB) {  
  for(int y=0; y<img.height; y++) {
    for(int x=0; x<img.width; x++) {
      int rh, gh, bh, rv, gv, bv;
      rh = gh = bh = rv = gv = bv = 0;
      
      if(x>0 && y>0) {
        rh+=   red(img.get(x-1, y-1)) * -1;
        gh+= green(img.get(x-1, y-1)) * -1;
        bh+=  blue(img.get(x-1, y-1)) * -1;
        
        rv+=   red(img.get(x-1, y-1)) * -1;
        gv+= green(img.get(x-1, y-1)) * -1;
        bv+=  blue(img.get(x-1, y-1)) * -1;
      }
      
      if(x>0) {
        rv+=   red(img.get(x-1, y)) * -2;
        gv+= green(img.get(x-1, y)) * -2;
        bv+=  blue(img.get(x-1, y)) * -2;
      }

      if(x>0 && y<img.height-1) {
        rh+=   red(img.get(x-1, y+1)) * 1;
        gh+= green(img.get(x-1, y+1)) * 1;
        bh+=  blue(img.get(x-1, y+1)) * 1;
        
        rv+=   red(img.get(x-1, y+1)) * -1;
        gv+= green(img.get(x-1, y+1)) * -1;
        bv+=  blue(img.get(x-1, y+1)) * -1;
      }

      if(y>0) {
        rh+=   red(img.get(x, y-1)) * -2;
        gh+= green(img.get(x, y-1)) * -2;
        bh+=  blue(img.get(x, y-1)) * -2;
      }

      if(y<img.height-1) {
        rh+=   red(img.get(x-1, y-1)) * 2;
        gh+= green(img.get(x-1, y-1)) * 2;
        bh+=  blue(img.get(x-1, y-1)) * 2;
      }

      if(x<img.width-1 && y>0) {
        rh+=   red(img.get(x-1, y-1)) * -1;
        gh+= green(img.get(x-1, y-1)) * -1;
        bh+=  blue(img.get(x-1, y-1)) * -1;
        
        rv+=   red(img.get(x-1, y-1)) * 1;
        gv+= green(img.get(x-1, y-1)) * 1;
        bv+=  blue(img.get(x-1, y-1)) * 1;
      }

      if(x<img.width-1) {
        rv+=   red(img.get(x-1, y-1)) * 2;
        gv+= green(img.get(x-1, y-1)) * 2;
        bv+=  blue(img.get(x-1, y-1)) * 2;
      }

      if(x<img.width-1 && y<img.height-1) {
        rh+=   red(img.get(x-1, y-1)) * 1;
        gh+= green(img.get(x-1, y-1)) * 1;
        bh+=  blue(img.get(x-1, y-1)) * 1;
        
        rv+=   red(img.get(x-1, y-1)) * 1;
        gv+= green(img.get(x-1, y-1)) * 1;
        bv+=  blue(img.get(x-1, y-1)) * 1;
      }
      
      anglesR[x][y] = atan2(rh, rv);
      anglesG[x][y] = atan2(gh, gv);
      anglesB[x][y] = atan2(bh, bv);      
    }
  }
}

// Finds the average color of a square of size sampleSize in img
// with upper-right corner define by x0 and y0
color findAverage(PImage img, int x0, int y0, int sampleSize) {
  color c;
  int r, g, b;
  r = g = b = 0;
   
  for(int y=y0; y<y0+sampleSize; y++) {
    for(int x=x0; x<x0+sampleSize; x++) {
      c = img.get(x, y);
      r+= red(c);
      g+= green(c);
      b+= blue(c);
    }
  }
  
  return color(r/(sampleSize*sampleSize),
               g/(sampleSize*sampleSize),
               b/(sampleSize*sampleSize));
}

// Finds the average value of a square of size sampleSize in the
// angles array with upper-right corner define by x0 and y0
float findAverage(float[][] angles, int x0, int y0, int sampleSize) {
  float f=0;
     
  for(int y=y0; y<y0+sampleSize; y++) {
    for(int x=x0; x<x0+sampleSize; x++) {
      f += angles[x][y];
    }
  }
  return f/(sampleSize*sampleSize);
}


//------------------ Util Methods --------------------------------

// Goes from black/white halftone to colored squiggles when SPACE key is pressed
// Increments/Decrements picture with right/left arrow keys
void keyPressed() {
  if(key==' ') {
    type = (type+1)%3;
  } else if(key==java.awt.event.KeyEvent.VK_RIGHT) {
    imgIndex = (imgIndex+1)%images.length;
    load();
  } else if(key==java.awt.event.KeyEvent.VK_LEFT) {
    imgIndex = (imgIndex+images.length-1)%images.length;
    load();
  }
}

