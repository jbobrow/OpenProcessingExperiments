
/* @pjs preload="snowflake.jpg"; */

// use up and down arrow keys to control block size
PImage snowflake, pic;
int block;
int pow2;
int rot;
int neighbor;
int mode;

void setup() {
  size(640, 480);
  block = 1; // 1x1
  mode = 1; // average blocks
  pow2 = 8; // reduce to 1 bit in mode 2
  rot = 0; // 0 radians for rotations in mode 3 
  neighbor = 3; // 3x3 averaging for mode 4
  snowflake = loadImage("snowflake.jpg");
  pic = createImage(snowflake.width, snowflake.height, RGB);
}

void draw() {
  background(192);
  fill(10);
  textSize(36);

  switch (mode) {
    case 1: // average of block
      if (block == 1)
        image(snowflake, 0, 0);
      else
        image(pic, 0, 0);
  
      text(block + "x" + block, 290, 465);
      break;
    case 2: // gray scale bit depth reduction
      image(pic, 0, 0);
      
      text("reduced to " + (9 - pow2) + " bit grayscale", 120, 465);
      break;
    case 3: // rotation - built in way
      pushMatrix();
      translate(snowflake.width / 2, snowflake.height / 2);
      rotate(HALF_PI * rot / 2);
      image(snowflake, -snowflake.width / 2, -snowflake.height / 2);
      popMatrix();
      
      fill(255);
      text("rotated " + (rot * 45) + " degrees", 181, 466);
      fill(10);
      text("rotated " + (rot * 45) + " degrees", 180, 465);
      break;
    case 4: // each pixel average of x by x block of neighbors
      image(pic, 0, 0);
    
      text("average of nearest " + neighbor + "x" + neighbor + " neighbors", 30, 465);
      break;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP && mode == 1) { 
      block += 2;
      updateSnowflake();
    } 
    else if (keyCode == DOWN && mode == 1) {
      if (block > 1) {
        block -= 2;
        updateSnowflake();
      }
    }
    else if (keyCode == RIGHT && mode == 2) {
      if (pow2 > 1) {
        pow2--;
        xBitSnowflake();
      }
    }
    else if (keyCode == LEFT && mode == 2) {
      if (pow2 < 8) {
        pow2++;
        xBitSnowflake();
      }
    }
  }
  else {
    if (key == '1') {
      mode = 1;
      updateSnowflake();
    }
    else if (key == '2') {
      mode = 2;
      xBitSnowflake();
    }
    else if (key == '3') {
      mode = 3;
    }
    else if (key == '4') {
      mode = 4;
      avgNeighbors();
    }
    else if ((key == 'r' || key == 'R') && mode == 3) {
      rot = (rot + 1) % 3;
    }
    else if ((key == 'n' || key == 'N') && mode == 4) {
      if (neighbor == 3) neighbor = 10;
      else if (neighbor == 10) neighbor = 20;
      else neighbor = 3;
      
      avgNeighbors();
    }
  }
}

void xBitSnowflake() {
  int gray;
  color pix;
  int power = (int)(pow(2, pow2)); 
  pic.loadPixels();
  for (int i = 0; i < snowflake.pixels.length; i++) {
    pix = snowflake.pixels[i];
    gray = (int)((red(pix) + green(pix) + blue(pix)) / 3); // no component weighting. could be tweaked for better grayscale
    if (power == 256) 
      gray = (int)((gray + 48) / 256) * 256; // make highest 48 shades = white. not enough pixels otherwise
    else
      gray = (int)((gray + 16) / power) * power; // make highest 16 shades = white. experimentally derived

    pic.pixels[i] = color(gray, gray, gray);
  }
  pic.updatePixels();
}

void updateSnowflake() {
  if (block > 1) {
    pic.loadPixels();
    for (int x = 0; x < pic.width; x += block) {
      for (int y = 0; y < pic.height; y += block) {
        updateBlock(x, y, block, true); // update all pixels in block with average value
      }
    }
    pic.updatePixels();
  } 
}

void avgNeighbors() {
  pic.loadPixels();
  for (int x = 0; x < pic.width; x++) {
    for (int y = 0; y < pic.height; y++) {
      updateBlock(x, y, neighbor, false); // only update pixel at (x,y) with average value of block
    }
  }
  pic.updatePixels();
}

void updateBlock(int x, int y, int size, boolean all) {
  long numValues = size * size;
  long averageR = 0;
  long averageG = 0;
  long averageB = 0;
  color pix;
  int half = (int)(size / 2);
  
  // find average pixel value in a block
  for (int i = x - half; i < x + half + 1; i++) {
    for (int j = y - half; j < y + half + 1; j++) {
      if (i > -1 && j > -1 && i < snowflake.width && j < snowflake.height) {
        pix = snowflake.pixels[i + j * snowflake.width];
        averageR += red(pix);
        averageG += green(pix);
        averageB += blue(pix);        
      }
      else
        numValues--; // adjustment for pixels off image
    }
  }
  
  averageR = (int)(averageR / numValues);
  averageG = (int)(averageG / numValues);
  averageB = (int)(averageB / numValues);
    
  // set pixel(s) to average value
  if (all) {
    for (int i = x - half; i < x + half + 1; i++) {
      for (int j = y - half; j < y + half + 1; j++) {
        if (i > -1 && j > -1 && i < snowflake.width && j < snowflake.height) {
          pic.pixels[i + j * snowflake.width] = color(averageR, averageG, averageB);
        }
      }
    }
  }
  else
    pic.pixels[x + y * snowflake.width] = color(averageR, averageG, averageB); 
}
