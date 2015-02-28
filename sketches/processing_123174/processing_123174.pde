
PImage img; 

int mode = 1;
int row = 0;

void setup() {
  background(0);
  //colorMode(HSB, 255);
  img  = loadImage("profilr.jpg");
  size(img.width, img.height);
}

void draw() {  
  img.loadPixels();
  switch(mode) {
  case 0:
    mode0();
    break;
  case 1:
    mode1();
    break;
  case 2:
    mode2();
  default:
    break;
  }
  img.updatePixels();
  saveFrame("glitched_mode_"+mode+"_"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".jpg");
  System.exit(0);
}



void mode0() {
  int[][] colourfreq2 = new int [3][img.width*img.height + 800000];

  for ( int k = 0; k < img.width;k++) {
    for ( int l = 0; l < img.height;l++) {
      int realLoc = k + (l * img.width);
      colourfreq2[0][realLoc +     (int)red(img.pixels[realLoc])] = (int)red(img.pixels[realLoc]);  // w tym kawalku kodu, wazne jest to
      colourfreq2[1][realLoc +     (int)green(img.pixels[realLoc])] = (int)green(img.pixels[realLoc]);  // co jest tuz po plusie czyli
      colourfreq2[2][realLoc +     (int)blue(img.pixels[realLoc])] = (int)blue(img.pixels[realLoc]);  // colourfreq[0/1/2][k]
    }
  }
  for ( int g = 0; g < img.width;g++) {
    for ( int f = 0; f < img.height;f++) {
      int loc2 = g + f*img.width;
      stroke(colourfreq2[0][loc2], colourfreq2[1][loc2], colourfreq2[2][loc2]);
      point(g, f);
    }
  }
}

void mode1() {
  int[][] colourfreq2 = new int [3][img.width*img.height];

  for ( int k = 0; k < img.width;k++) {
    for ( int l = 0; l < img.height;l++) {
      int realLoc = k + (l * img.width);
      int newLocR = constrain((realLoc +     img.width*(int)red(img.pixels[realLoc])), 0, img.width*img.height-1);
      int newLocG = constrain((realLoc +     img.width*(int)green(img.pixels[realLoc])), 0, img.width*img.height-1);
      int newLocB = constrain((realLoc +     img.width*(int)blue(img.pixels[realLoc])), 0, img.width*img.height-1);
      colourfreq2[0][newLocR] = (int)red(img.pixels[realLoc]);  // w tym kawalku kodu, wazne jest to
      colourfreq2[1][newLocG] = (int)green(img.pixels[realLoc]);  // co jest tuz po plusie czyli
      colourfreq2[2][newLocB] = (int)blue(img.pixels[realLoc]);  // colourfreq[0/1/2][k]
    }
  }
  for ( int g = 0; g < img.width;g++) {
    for ( int f = 0; f < img.height;f++) {
      int loc2 = g + f*img.width;
      stroke(colourfreq2[0][loc2], colourfreq2[1][loc2], colourfreq2[2][loc2]);
      point(g, f);
    }
  }
}

void mode2() {
  int[][] colourfreq2 = new int [3][img.width*img.height + 800000];

  for ( int k = 0; k < img.width;k++) {
    for ( int l = 0; l < img.height;l++) {
      int realLoc = k + (l * img.width);
      colourfreq2[0][abs(realLoc -     img.width*(int)red(img.pixels[realLoc]))] = (int)red(img.pixels[realLoc]);  // w tym kawalku kodu, wazne jest to
      colourfreq2[1][abs(realLoc -     img.width*(int)green(img.pixels[realLoc]))] = (int)green(img.pixels[realLoc]);  // co jest tuz po plusie czyli
      colourfreq2[2][abs(realLoc -     img.width*(int)blue(img.pixels[realLoc]))] = (int)blue(img.pixels[realLoc]);  // colourfreq[0/1/2][k]
    }
  }
  for ( int g = 0; g < img.width;g++) {
    for ( int f = 0; f < img.height;f++) {
      int loc2 = g + f*img.width;
      stroke(colourfreq2[0][loc2], colourfreq2[1][loc2], colourfreq2[2][loc2]);
      point(g, f);
    }
  }
}



