
PImage ss;
PImage s2;
int sw;
int sh;

boolean click = false;

void setup(){
  size(320, 240);

  // I made my own version of the kitten image in Photoshop
  // And corrupted it with exactly the same pixels that Golan used
  // Except I saved it as a PNG to reduce JPG artifacts
  ss = loadImage("cream_kitten_jeff1.png");  // black specks
  ss.loadPixels();
  s2 = loadImage("cream_kitten_jeff0.png");  // no black specks

  sw = ss.width;
  sh = ss.height;
}

void draw(){
  background(255);

  // show the original kitten (with no noise)
  if (click==true) {
    image(s2, 0, 0);
  }

  // show the corrupted kitten image
  // run the noise removal
  else {
    image(ss, 0,0);

    float brightestWeHaveSeen = 0;
    int brightestX = 0;
    int brightestY = 0;

    for (int y=0; y<sh; y++){
      for(int x=0; x<sw; x++){

        color c = getColorAtXYFromImage(x, y, ss);

        float r = red(c);
        float g = green(c);
        float b = blue(c);

        if (r<10 && g<10 && b<10 ) {

          float nR = 0;
          float nG = 0;
          float nB = 0;
          int pCount = 0;

          // get pixels on either side
          for (int i=x-1; i<x+1; i++) {

            color fix = getColorAtXYFromImage(i, y, ss);
            if (i!=x && x<sw*sh && (red(fix)+green(fix)+blue(fix))>5) {
              nR+=red(fix);
              nG+=green(fix);
              nB+=blue(fix);
              pCount++;
            }
          }

          // get pixels above and below
          for (int i=y-1; i<y+1; i++) {
            if (i>0 && i<sh) {  // don't want the first or last row
              color fix = getColorAtXYFromImage(x, i, ss);
              if (i!=y && (red(fix)+green(fix)+blue(fix))>5) {
                nR+=red(fix);
                nG+=green(fix);
                nB+=blue(fix);
                pCount++;
              }

            }
          }

          // average the colors
          if (pCount>0){ // don't want to divide by zero
            nR = nR/(float)pCount;
            nG = nG/(float)pCount;
            nB = nB/(float)pCount;
          }

          // rewrite the image pixels
          stroke(nR,nG,nB);
          point(x,y);

        }
      }
    }
  }

}

color getColorAtXYFromImage(int x, int y, PImage img){
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[loc];
  } else {
    return 0;
  }
}

// used to cycle between the before and after images
void mousePressed() {
  click = true;
}
void mouseReleased() {
  click = false;
}

