
int c = MIN_INT;

PImage img;

int w = 512;
int h = 512;

int minW = 200;
int maxW = 1024;
int minH = 200;
int maxH = 1024;

int increment = 1;

void setup() {
  //size(displayWidth, displayHeight);
  size(w, h);
  img = createImage(width, height, RGB);
}

// . . . . . . . . . . . . . . . . . . .

void draw() {

  if ( keyPressed) {
    if (key == 'q' || key == 'Q') {
      w = constrain(w-increment, minW, maxW);
    }  
    else if (key == 'w' || key == 'W') {
      w = constrain(w+increment, minW, maxW);
    }
    else if (key == 'a' || key == 'A') {
      h = constrain(h-increment, minH, maxH);
    }  
    else if (key == 'z' || key == 'Z') {
      h = constrain(h+increment, minH, maxH);
    }
    size(w, h);
    img = createImage(width, height, RGB);
    
    
  }


  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = i+c;
  }
  c+=img.pixels.length;

  set(0, 0, img);
}

// . . . . . . . . . . . . . . . . . . .

