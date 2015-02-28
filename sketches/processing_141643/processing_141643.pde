
int t = 0; //time
int z = 0; //pixel's value
int tx = 0; //Coordinate X (rows)
int ty = 0; //Coordinate Y (columns)
int i = 0; //Counter for pixel in a frame
int width = 256;
int height = 256;
int resolution = 16;
aspect = width/height;

void setup() {
  size(width, height);
  frameRate(24);
  noStroke();
}

//Draw a frame (16 rows * 16 columns = 256 "pixels")
void aframe() {
  for (i=0; i<256; i++) {
    tx = floor((t / 16) % 16);
    ty = floor(t % 16);
    z = (t); //THE FORMULA - modify it for other graphic
    //Limit to 0-255 (unsigned short, 8 bit) dynamic range
    z = z%256;
    if (z<0)
      z=255+z;
    fill(z);
    rect(tx*resolution, ty*resolution, resolution, resolution);
    t++;
  }
}

void draw() { 
  aframe();
}
