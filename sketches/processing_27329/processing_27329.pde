
// I'm sure this can be written recursively, but I'm too tired to not mess that up right now

PImage a;

int[] pass1, pass2, pass3, pass4, pass5;
int w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, distance;

void setup() {
  a = loadImage("blue.jpg");
  a.loadPixels();
  //  size(a.width, a.height, P2D);
  size(480, 800, P2D);

  w1 = width>>1;
  h1 = height>>1;
  pass1 = new int[w1*h1];

  w2 = w1>>1;
  h2 = h1>>1;
  pass2 = new int[w2*h2];

  w3 = w2>>1;
  h3 = h2>>1;
  pass3 = new int[w3*h3];

  w4 = w3>>1;
  h4 = h3>>1;
  pass4 = new int[w4*h4];

  w5 = w4>>1;
  h5 = h4>>1;
  pass5 = new int[w5*h5];

  loadPixels();
  noCursor();
}

void draw() {
  if (frameCount%8 == 0) {
    for (int i = 0; i < w1; ++i) {
      for (int j = 0; j < h1; ++j) {
        pass1[i + j*w1] = a.pixels[2*i + 2*j*width + int(random(0, 2)) + int(random(0, 2))*width];
      }
    }
  }
  if (frameCount%7 ==0) {
    for (int i = 0; i < w2; ++i) {
      for (int j = 0; j < h2; ++j) {
        pass2[i + j*w2] = pass1[2*i + 2*j*w1 + int(random(0, 2)) + int(random(0, 2))*w1];
      }
    }
  }
  if (frameCount%6 == 0) {
    for (int i = 0; i < w3; ++i) {
      for (int j = 0; j < h3; ++j) {
        pass3[i + j*w3] = pass2[2*i + 2*j*w2 + int(random(0, 2)) + int(random(0, 2))*w2];
      }
    }
  }
  if (frameCount%5 == 0) {
    for (int i = 0; i < w4; ++i) {
      for (int j = 0; j < h4; ++j) {
        pass4[i + j*w4] = pass3[2*i + 2*j*w3 + int(random(0, 2)) + int(random(0, 2))*w3];
      }
    }
  }
  if (frameCount%2 == 0) {
    for (int i = 0; i < w5; ++i) {
      for (int j = 0; j < h5; ++j) {
        pass5[i + j*w5] = pass4[2*i + 2*j*w4 + int(random(0, 2)) + int(random(0, 2))*w4];
      }
    }
  }
  /*
  // this version left sharp circles, the version below has properly pixelated borders
   for (int i = 0; i < width; ++i) {
   for (int j = 0; j < height; ++j) {
   distance = (i-mouseX)*(i-mouseX) + (j-mouseY)*(j-mouseY); // distance from pixel to mousecursor, squared
   
   if (distance > ((width*width)>>2)) {
   pixels[i + j*width] = pass5[(i>>5) + (j>>5)*w5];
   }
   else if (distance > ((width*width)>>3)) {
   pixels[i + j*width] = pass4[(i>>4) + (j>>4)*w4];
   }
   else if (distance > ((width*width)>>4)) {
   pixels[i + j*width] = pass3[(i>>3) + (j>>3)*w3];
   }
   else if (distance > ((width*width)>>5)) {
   pixels[i + j*width] = pass2[(i>>2) + (j>>2)*w2];
   }
   else if (distance > ((width*width)>>6)) {
   pixels[i + j*width] = pass1[(i>>1) + (j>>1)*w1];
   }
   else {
   pixels[i + j*width] = a.pixels[i + j*width];
   }
   }
   }
   */

  //oh god what. What the hell am I doing? I know what I'm doing but for god's sake why?!
  //surely there's a more elegant way to do this. I'm too tired to think of one right now...
  int xy;
  for (int i = 0; i < w5; ++i) {
    for (int j = 0; j < h5; ++j) {
      distance = (i-(mouseX>>5))*(i-(mouseX>>5)) + (j-(mouseY>>5))*(j-(mouseY>>5));
      xy = (i<<5) + (j<<5) * width;
      if (distance > (w5*w5+int(random(-128, 128)))) {
        for (int x = 0; x < (1<<5); ++x) {
          for (int y = 0; y < (1<<5); ++y) {
            pixels[xy + x + y*width] = pass5[i + j*w5];
          }
        }
      } 
      else { // we need to go deeper
        for (int i2 = 0; i2 < 2; ++i2) {
          for (int j2 = 0; j2 < 2; ++j2) {
            distance = ((i<<1) + i2 - (mouseX>>4))*((i<<1) + i2 -(mouseX>>4)) + ((j<<1) + j2 -(mouseY>>4))*((j<<1) + j2 -(mouseY>>4));
            if (distance > ((w4*w4)>>1)+int(random(-256, 256))) {
              for (int x = 0; x < (1<<4); ++x) {
                for (int y = 0; y < (1<<4); ++y) {
                  pixels[xy + (i2<<4) + (j2<<4)*width + x + y*width] = pass4[(i<<1) + i2 + ((j<<1)+j2)*w4];
                }
              }
            } 
            else { // this is going to get very ugly...
              for (int i3 = 0; i3 < 2; ++i3) {
                for (int j3 = 0; j3 <2; ++j3) {
                  distance = ((i<<2) + (i2<<1) + i3 - (mouseX>>3))*((i<<2) + (i2<<1) + i3 - (mouseX>>3)) + 
                    ((j<<2) + (j2<<1) + j3 -(mouseY>>3))*((j<<2) + (j2<<1) + j3 -(mouseY>>3));
                  if (distance >((w3*w3)>>3)+int(random(-256, 256))) {
                    for (int x = 0; x < (1<<3); ++x) {
                      for (int y = 0; y < (1<<3); ++y) {
                        pixels[xy + (i2<<4) + (i3<<3) + ((j2<<4)+(j3<<3))*width + x + y*width] = pass3[(i<<2) + (i2<<1) + i3 + ((j<<2) + (j2<<1) + j3)*w3];
                      }
                    }
                  }
                  else {
                    for (int i4 = 0; i4< 2; ++i4) {
                      for (int j4 = 0; j4 < 2; ++j4) {
                        distance = ((i<<3) + (i2<<2) + (i3<<1) + i4 - (mouseX>>2))*((i<<3) + (i2<<2) + (i3<<1) + i4 - (mouseX>>2)) + 
                          ((j<<3) + (j2<<2) + (j3<<1) + j4 -(mouseY>>2))*((j<<3) + (j2<<2) + (j3<<1) + j4 -(mouseY>>2));
                        if (distance > ((w2*w2)>>5)+int(random(-256, 256))) {
                          for (int x = 0; x < (1<<2); ++x) {
                            for (int y = 0; y < (1<<2); ++y) {
                              pixels[xy + (i2<<4) + (i3<<3) + (i4<<2) + ((j2<<4)+(j3<<3)+(j4<<2))*width + x + y*width] = pass2[(i<<3) + (i2<<2) + (i3<<1) + i4 + ((j<<3)+(j2<<2)+(j3<<1)+j4)*w2];
                            }
                          }
                        } 
                        else {
                          for (int i5 = 0; i5 < 2; ++i5) {
                            for (int j5 = 0; j5 < 2; ++j5) {
                              distance = ((i<<4) + (i2<<3) + (i3<<2) + (i4<<1) + i5 - (mouseX>>1))*((i<<4) + (i2<<3) + (i3<<2) + (i4<<1) + i5 - (mouseX>>1)) + 
                                ((j<<4) + (j2<<3) + (j3<<2) + (j4<<1) + j5 -(mouseY>>1))*((j<<4) + (j2<<3) + (j3<<2) + (j4<<1) + j5 -(mouseY>>1));
                              for (int x = 0; x < 2; ++x) {
                                for (int y = 0; y < 2; ++y) {
                                  if (distance > ((w1*w1)>>7)+int(random(-256, 256))) {
                                    pixels[xy + (i2<<4) + (i3<<3) + (i4<<2) + (i5<<1) + ((j2<<4)+(j3<<3)+(j4<<2)+(j5<<1))*width + x + y*width] = pass1[(i<<4) + (i2<<3) + (i3<<2) + (i4<<1) + i5 + ((j<<4)+(j2<<3)+(j3<<2)+(j4<<1)+j5)*w1];
                                  } 
                                  else {
                                    pixels[xy + (i2<<4) + (i3<<3) + (i4<<2) + (i5<<1) + ((j2<<4)+(j3<<3)+(j4<<2)+(j5<<1))*width + x + y*width] = a.pixels[(i<<5) + (i2<<4) + (i3<<3) + (i4<<2) + (i5<<1) + x + ((j<<5)+(j2<<4)+(j3<<3)+(j4<<2)+(j5<<1)+y)*width];
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  updatePixels();
}


