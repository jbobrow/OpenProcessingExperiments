
int t = 0; //time
int z = 0; //pixel's value
int tx = 0; //Coordinate X (rows)
int ty = 0; //Coordinate Y (columns)
int i = 0; //Counter for pixel in a frame

void setup() {
  size(512, 512);
  frameRate(60);
  noStroke();
}

//Draw a frame (8 rows * 8 columns = 256 "pixels")
void aframe() {
  for (i=0; i<256; i++) {
    tx = floor((t / 32) % 32);
    ty = floor(t % 32);
    z = ((t%(t%31)*6)); //THE FORMULA - modify it for other graphic
    //Limit to 0-255 (unsigned short, 8 bit) dynamic range
    z = z%256;
    if (z<0)
      z=255+z;
    fill(z);
    rect(tx*16, ty*16, 16, 16);
    t++;
  }
}

void draw() { 
  aframe();
}
