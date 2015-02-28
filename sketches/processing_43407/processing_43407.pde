
/*
I know I have a problem with edges but haven't figured out how to 
detect for those and solve that issue. Help anyone?
*/

PImage sunset;
int sunsetCopy[];

void setup() {
  sunset = loadImage("problematic_sunset.jpg");
  sunset.loadPixels();
  int wpx = sunset.width;
  int hpx = sunset.height;
  size(wpx,hpx);

  // create a pixel array copy so we can calculate with one and spit in the other
  sunsetCopy = new int[sunset.pixels.length];
  for (int i=0; i<sunset.pixels.length; i++) {
    sunsetCopy[i] = sunset.pixels[i];
  }

  // determine what is a bird pixel
  findBirds();

  // get rid of the birds
  removeBirds();

  // copy back into our image array for easy viewing 
  for (int i=0; i<sunsetCopy.length; i++) {
    sunset.pixels[i] = sunsetCopy[i];
  }
}

void draw() {
  image(sunset,0,0);
}

void findBirds() {
  // how should we mark the pixels we find?
  color marked = color(255,255,255);

  // find bird pixels
  for (int x=0; x<sunset.width; x++) {
    for (int y=0; y<sunset.height; y++) {
      int pxLocation = (y * sunset.width) + x;       

      if (isBirdPixel(pxLocation)) {
        sunsetCopy[pxLocation] = marked;
      }      
    }
  }
}

boolean pixelDiffTest(color c, color x) {
  float requiredAmount1 = 3.7;
  float diff1 = abs(saturation(c) - saturation(x));

  float requiredAmount2 = .7;
  float diff2 = abs(hue(c) - hue(x));

  if (diff1 > requiredAmount1) return true;
  //if (diff2 > requiredAmount2) return true;
  //if (diff1 > requiredAmount1 && diff2 > requiredAmount2) return true;
  return false;
}

boolean isBirdPixel(int pxLocation) {
  boolean birdPixel = false;
  boolean valueDiff1 = false;
  boolean valueDiff2 = false;
  // note which pixels we're interested in, based on the current pixel
  int pixelsOfInterest[] = {
    pxLocation, 
    pxLocation + 1, // right
    pxLocation - 1, // left
    pxLocation - sunset.width, // above
    pxLocation + sunset.width, // below
    pxLocation + sunset.width + 1, // diag: down, right
    pxLocation + sunset.width - 1, // diag: down, left
    pxLocation - sunset.width + 1, // diag: up, right
    pxLocation - sunset.width - 1, // diag: up, left
  };
  for (int i=0; i<pixelsOfInterest.length; i++) {
    // avoid those pesky out of bounds errors
    if (pixelsOfInterest[i] > 0 && pixelsOfInterest[i] < sunset.pixels.length - 1) {
      // check if this pixel meets our cirteria
      if (brightness(sunset.pixels[pixelsOfInterest[i]]) < 43) birdPixel = true;

      // check neighboring pixels to see what the difference between them is
      // criteria for enough difference and of what is in the pixelDiffTest function
      valueDiff1 = pixelDiffTest(sunset.pixels[pixelsOfInterest[i]], sunset.pixels[pixelsOfInterest[i]]-1);
      valueDiff2 = pixelDiffTest(sunset.pixels[pixelsOfInterest[i]], sunset.pixels[pixelsOfInterest[i]]+1);
      if (valueDiff1 || valueDiff2) {
        birdPixel = true;
      }
    }
  }

  if (birdPixel) return true;
  return false;
}

int colorize(int pxLocation) {
  int pixelsOfInterest[] = {
    pxLocation + 1, // right
    pxLocation - 1, // left
    pxLocation + 2, // right 2
    pxLocation - 2, // left 2
    pxLocation + 3, // right 3
    pxLocation - 3, // left 3
  };
  float totalr = 0.0;
  float totalg = 0.0;
  float totalb = 0.0;
  float avgr = 0.0;
  float avgg = 0.0;
  float avgb = 0.0;
  int actualCount = 0;
  boolean thisIsWhite;
  for (int i=0; i<pixelsOfInterest.length; i++) {
    if (pixelsOfInterest[i] > 0 && pixelsOfInterest[i] < sunsetCopy.length - 1) {
      int val = sunsetCopy[pixelsOfInterest[i]];      
      float r = red(val);
      float g = green(val);
      float b = blue(val);
      if (r < 255 || g < 255 || b < 255) {
        actualCount++;
        totalr = totalr + r;
        totalg = totalg + g;
        totalb = totalb + b;
      }
    }
  }
  avgr = totalr/actualCount;
  avgg = totalg/actualCount;
  avgb = totalb/actualCount;

  color newcolor = color(avgr,avgg,avgb);
  return newcolor;
}

void outline(int location) {
  color white = color(255,0,0);
  if (location > 0) sunsetCopy[location-1] = white;
  if (location > sunsetCopy.length) sunsetCopy[location+1] = white;
  if (location > sunset.width) sunsetCopy[location-sunset.width] = white;
  if (location > sunset.width + 1) sunsetCopy[location-sunset.width+1] = white;
  if (location < sunsetCopy.length - sunset.width - 1) sunsetCopy[location+sunset.width] = white;
  if (location < sunsetCopy.length - sunset.width - 2) sunsetCopy[location+sunset.width-1] = white;
}

void removeBirds() {
  // outline marked white pixels
  for (int i=0; i<sunsetCopy.length; i++) {
    color c = sunsetCopy[i];
    if (red(c) == 255 && blue(c) == 255 && green(c) == 255) {
      outline(i);
      outline(i+1);
      outline(i-1);
    }
  }
  // turn the newly outlined red pixels white
  for (int i=0; i<sunsetCopy.length; i++) {
    color c = sunsetCopy[i];
    if (red(c) == 255 && blue(c) == 0 && green(c) == 0) {
      sunsetCopy[i] = color(255,255,255);
    }
  }
  // colorize
  for (int x=0; x<sunset.width; x++) {
    for (int y=0; y<sunset.height; y++) {
      int pxLocation = (y * sunset.width) + x;
      color c = sunsetCopy[pxLocation];
      if (red(c) == 255 && blue(c) == 255 && green(c) == 255) {
        sunsetCopy[pxLocation] = colorize(pxLocation);
      }
    }
  }
}

