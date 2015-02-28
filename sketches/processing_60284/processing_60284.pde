
/**
 * 2D Bump Mapping of the OSAA logo
 *
 * Created by Rene Hangstrup Møller
 *
+ * Warming up for the Processing workshop at Open Space Aarhus
 * http://osaa.dk/wiki/index.php/Processingworkshops
 */
 
PImage colorImg; // color map for the logo


// will hold extracted height values from the height image.


// a spot-light light map will be calculated into this array
int[] lightMap = new int[600*600];

void setup() {
  // same size as the images
  size(600, 600);
  
  // load the color and height maps
  colorImg = loadImage("Factory.JPG"); 

 // calculate the light map
  for (int y = 0; y < 600; y++) {
    for (int x = 0; x < 600; x++) {
      // calculate the distance from the center of the lightmap to each pixel.
      // invert it so we have 255 in the center and 0 at the edges. 
      // make sure the numbers are in the range [0-255]
      // this results in something that looks like a ball
      int d = constrain((int)(255 - 255 * dist(500, 500, x, y) / 190), 0, 255);
      lightMap[x + y * 600] = d;
    }
  }
}

void draw() {
  
  // move the light in harmonic curves
  int lightX = (int)(600 * cos(millis()/1000.0));
  int lightY = (int)(600 * sin(millis()/3000.0));
  
  // prepare the pixels array for the screen
  // we dont need the current pixel data, but the documentation seems to hint
  // that we should do it anyway before accessing the pixels[] array.
  loadPixels();

  // we skip a 1 pixel border of the screen to accomodate for the gradient calculation
  for (int y = 1; y < 599; y++) {
    for (int x = 1; x < 599; x++) {
      // calculate the gradient at each pixel, by comparing the height of neighbouring pixels

      
      // calculate where to read the light intensity from the light map
      // start with current pixel position
      // offset by the light position
      // and offset it further based on the gradient values (dx, dy)
      // we double the gradient to make edges more visible. 
      // try multiplying with four instead for more dramatic bumps :-)
      // finally make sure to clamp values to within light map range [0-379]
      int lx = constrain(lightX + x * 2, 0, 599);
      int ly = constrain(lightY + y * 2, 0, 599);
      
      // lookup light intensity from the light map and add a small amount of ambient light
      int intensity = lightMap[lx + ly * 600] + 16;
      
      // read the pixel color form the color map
      color p = colorImg.get(x, y);      
      
      // multiply light intensity with each color component and clamp to range [0-255]
      int r = min(255, (int)((red(p)) * intensity / 256.0));
      int g = min(255, (int)((green(p)) * intensity / 256.0));
      int b = min(255, (int)((blue(p)) * intensity / 256.0));
      
      // output the calculated pixel
      pixels[x + y *600] = color(r, g, b);
    }
  }   
  
  // copy pixel[] to screen buffer
  updatePixels();
}


