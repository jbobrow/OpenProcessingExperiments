
// Alien Blob 2.1 (Feb 15 '06)
// based on formula by Jim Bumgardner
// Processing port by Ryan Govostes and Jim Bumgardner
// Note: This can now be done far more efficiently with a shader

float xoff = 0, yoff = 0, zoff = 0;
float sineTable[];
 
void setup() {
  size(512, 512);
  colorMode(HSB, 2);
  background(0);
  noiseDetail(1);
  // framerate(24);
 
  // precalculate 1 period of the sine wave (360 degrees)
  sineTable = new float[360];
  for (int i = 0; i < 360; i ++) sineTable[i] = sin(radians(i));
}
 
void draw() {
  float d, h, s, b, n;
  float xx;
  float yy = yoff;
  int w2 = width / 2;
  int h2 = height / 2;
  int offset = 0;
 
  loadPixels();
   
  for (int y = 0; y < height; y ++) {
    xx = xoff;
    for (int x = 0; x < width; x ++) {
      d = dist(x, y, w2, h2) * 0.025;
      if (d * 20 <= 90) {
        n = noise(xx, yy, zoff); // noise only needs to be computed once per pixel
         
        // use pre-calculated sine results
        h = 1 - sineTable[int(degrees(d + n * 3)) % 360] % 2;
        s = sineTable[int(degrees(d + n * 2)) % 360] * .5 + 1;
        b = sineTable[int(degrees(d + n)) % 360] + 1;
         
        // determine pixel color
        pixels[offset ++] = color(h, s, b);
      } else {
        pixels[offset ++] = color(0, 0, 0);
      }
       
      // increment xx
      xx += 0.03125;
    }
     
    // this value only needs to be changed once per pixel line
    yy += 0.03125;
  }
   
  // move through noise space -> animation
  xoff += 0.3;
  yoff += 0.07;
  zoff += 0.1;
   
  updatePixels();
}



