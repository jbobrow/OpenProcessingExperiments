
PImage img;
int direction = 1;

float signal;

void setup() {
  size(500, 333);
  stroke(255);
  // Before we deal with pixels
loadPixels();

// Loop through every pixel
for (int i = 0; i < pixels.length; i++ ) { // We can get the length of the pixels array just like with any array.
  
  // Pick a random number, 0 to 255
  float rand = random(255);
  
  // Create a grayscale color based on random number
  color c = color(rand);
  
  // Set pixel at that location to random color
  pixels[i] = c; // We can access individual elements of the pixels array via an index, just like with any other array.
}

// When we are finished dealing with pixels
updatePixels();
  img = loadImage("Family_20.jpg");
  img.loadPixels();
  loadPixels();
}

void draw() {
  if (signal > img.height-1 || signal < 0) { 
    direction = direction * -1; 
  }
  if (mousePressed) {
    signal = abs(mouseY % img.height);
  } else {
    signal += (0.3*direction);  
  }

  if (keyPressed) {
    set(0, 0, img);
    line(0, signal, img.width, signal);
  } else {
    int signalOffset = int(signal)*img.width;
    for (int y = 0; y < img.height; y++) {
      arrayCopy(img.pixels, signalOffset, pixels, y*width, img.width);
    }
    updatePixels();
  }
}

