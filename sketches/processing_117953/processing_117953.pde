
PImage bg;
PImage dist1, dist2, dist3;
int time = 0;

void distort_frame(PImage src, PImage dst, int t, int type)
{

  // Some hard-coded distortion parameters
  float A = 16.0;    // Amplitude
  float F = 0.1;    // Frequency
  float S = 0.25;    // Time scaling
  float C = 1.0;    // Compression (only used for vertical distortion)

  // Get pointers to raw bitmap data

  int width = src.width;
  int height = src.height;

  dst.loadPixels();
  // For each line...
  for(int y = 0; y < height; y++)
  {
    // Calculate the distortion offset for this line
    float value = F * y + S * t;
    int offset = int(A * sin(value/6.28));
    int src_x = 0;  // new x position
    int src_y = y;  // new y position


    if(type == 0)
      src_x = offset;
    else if(type == 1) {
      if (y%2 != 0)
        src_x = offset;
       else 
        src_x = -offset;
    }
    else if(type == 2)
      src_y = int(y * C + offset);

    // Wrap the y offset correctly - e.g., -1 should become height-1
    src_y = (src_y + height) % height;

    // Copy the line into the destination with translation
    for(int x = 0; x < width; x++)
    {

      // Also need to wrap the x offset
      src_x = (src_x + width) % width;
      dst.pixels[y * width + x] = src.pixels[src_y * width + src_x];
      //dst.set(x, y, src.get(src_x, src_y));
      src_x++;
    }
  }
  dst.updatePixels();
}

void setup() {
  size(512, 512);
  bg = loadImage("bg.bmp");
  dist1 = createImage(bg.width, bg.height, RGB);
  dist2 = createImage(bg.width, bg.height, RGB);
  dist3 = createImage(bg.width, bg.height, RGB);
  frameRate(60);
  loop();
}

void draw() {
 background(128);
 distort_frame(bg, dist1, time, 0);
 distort_frame(bg, dist2, time, 1);
 distort_frame(bg, dist3, time, 2);
 image(bg, 0, 0); 
 image(dist1, 256, 0);
 image(dist2, 0, 256);
 image(dist3, 256, 256);
 time++;
}


