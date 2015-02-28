
int t = 0; //time
int z = 0; //pixel's value
int tx = 0; //Coordinate X (rows)
int ty = 0; //Coordinate Y (columns)
int i = 0; //Counter for pixel in a frame
int scale  = 1;
int width  = 64;
int height = 64;

void setup() {
  size(width*scale, height*scale);
 
  frameRate(60);
  noStroke();
}

//Draw a frame (16 rows * 16 columns = 256 "pixels")
void aframe() {
  for (i=0; i<256; i++) {
    tx = floor((t / height) % width);
    ty = floor(t % height);
    z = ((t%(t%31)*6)); //THE FORMULA - modify it for other graphic
    //Limit to 0-255 (unsigned short, 8 bit) dynamic range
    z = z%256;
    if (z<0)
      z=255+z;
    fill(z);
    rect(tx*scale, ty*scale, scale, scale);
    t++;
  }
}

void draw() { 
  aframe();
}
