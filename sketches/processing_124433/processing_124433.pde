
float xstart, ystart, xdirnoise, ydirnoise, speed;
int step = 1;

void setup() {
  size(400, 400);
  xstart = random(10);
  ystart = random(10);
  xdirnoise = random(10); 
  ydirnoise = random(10);
  speed = 10; // speed of the wind 
}

void draw() {
  
  
  float xnoise = xstart;
  float ynoise = ystart;
  // noisy directions
  float xdir = (noise(xdirnoise) - 0.5) * speed;
  float ydir = (noise(ydirnoise) - 0.5) * speed;  
  // stable directions
  // xdir = -1;
  // ydir = -1;
  xstart = xstart + xdir * 0.01;
  ystart = ystart + ydir * 0.01;
  xdirnoise = xdirnoise + 0.01;
  ydirnoise = ydirnoise + 0.01;
    
  for (int y = 0; y < height; y = y + step) {  
    ynoise += 0.01;
    xnoise = xstart;
    for (int x = 0; x < width; x = x + step) {
      xnoise += 0.01;
      float nc = noise(xnoise, ynoise) * 255;
      /*
      // Red sky, yellow clouds
      fill(255, nc, 0);
      // Red sky, purple clouds
      fill(255, 0, nc);
      // Green sky, light blue clouds
      fill(0, 255, nc);
      // Green sky, yellow clouds
      fill(nc, 255, 0);
      // Blue sky, purple clouds
      fill(nc, 0, 255);
      */
      // Blue sky, light blue clouds
      fill(0, nc, 255);
      noStroke();
      rect(x, y, step, step);
    }
  }
  
  // comment next line for wind effect
  noLoop();
}




