
Ant[] ants;
int counter, noiseCount, speed;
//int[] antpixels, blurpixels;

void setup() 
{
  size(800, 400);
  background(0);
  speed = 100;
  int antw = 8;
  int anth = 4;
  ants = new Ant[antw*anth];
  antpixels = new int[width*height];
  blurpixels = new int[width*height];
  for (int i = 0; i < antw; ++i) {
    for (int j = 0; j < anth; ++j) {
      int c = int(0xFF000000 + int(random(0x1000000)));
      ants[i + j*antw] = new Ant( int( (2 * i + 1) * width / (2*antw)), int( (2 * j + 1) * height / (2*anth)), int(random(4)), c, antpixels);
    }
  }
  frameRate(75);
  counter = 0;
  loadPixels();
}

void draw() 
{
  /*
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if ((antpixels[i]&0xFFFFFF) != 0) {
      blurpixels[i] = antpixels[i];
    }
  }
  shiftBlur(blurpixels, pixels, width, height);
  */
  for (int i = 0; i < speed; i++) {
    for (int j = 0; j < ants.length; ++j) {
      ants[j].move();
    }
    counter++;
    noiseCount = int(2 + 10*cos(counter*TWO_PI/100000));
  }
  updatePixels();
}

int ANTUP = 3;
int ANTDOWN = 1;
int ANTLEFT = 2;
int ANTRIGHT = 0;

class Ant {
  int antX, antY, orientation;
  color pixelMask;
  int[] p;

  Ant(int x, int y, int _or, int _pM, int[] _p) {
    antX = x;
    antY = y;
    orientation = _or;
    pixelMask = _pM;
    p = _p;
  }

  void move() {
    quantumNoise();

    // Faster in JavaScript
    color pix = get(antX, antY);
    if ((pix & pixelMask) == 0) {
      orientation = (3 + orientation) % 4;
      set(antX, antY, pix | pixelMask);
      walk();
    }
    else {
      orientation = (1 + orientation) % 4;
      set(antX, antY, (pix | pixelMask) - pixelMask);      
      walk();
    }

    /*    
     //Faster in Java
     int xy = antX + antY * width;
     color pix = p[xy];
     if ((pix & pixelMask) == 0) {
     orientation = (3 + orientation) % 4;
     p[xy] = (pix | pixelMask);
     walk();
     }
     else {
     orientation = (1 + orientation) % 4;
     p[xy] = (pix | pixelMask) - pixelMask;      
     walk();
     }
     */
  }

  void walk() {
    if (orientation == ANTRIGHT)
      antX = ( antX + 1 ) % width;
    else if (orientation == ANTDOWN)
      antY = ( antY + 1 ) % height;
    else if (orientation == ANTLEFT)
      antX = ( width + antX - 1) % width;
    else
      antY = (height + antY - 1) % height;

    /*
      // diagonal movement
     if (orientation == ANTRIGHT) {
     antX = ( antX + 1 ) % width;
     antY = ( antY + 1 ) % height;
     }
     else if (orientation == ANTDOWN) {
     antX = ( width + antX - 1 ) % width;
     antY = ( antY + 1 ) % height;
     }
     else if (orientation == ANTLEFT) {
     antX = ( width + antX - 1) % width;
     antY = ( height + antY - 1 ) % height;
     }
     else {
     antX = ( antX + 1 ) % width;
     antY = (height + antY - 1) % height;
     }     
     */
  }


  void quantumNoise() {
    for (int i = 0; i < noiseCount; ++i) {


      // Faster in Javascript
      int rX = random(width);
      int rY = random(height);
      if (random(10000000) > 1) {
        set(rX, rY, 0xFF000000 | (get(rX, rY) | pixelMask) - pixelMask);
      }
      else {
        set(rX, rY, 0xFF000000 | get(rX, rY) | pixelMask);
      }

      /*      
       //Faster in Java
       int xy = int(random(width*height));
       color pix = p[xy];
       p[xy] = 0xFF000000 | ((pix | pixelMask) - pixelMask);
       */
    }
  }
}

/*
void shiftBlur(int[] s, int[] t, int w, int h) {
  int ym1ofs = (h-2) * w;
  int yofs = (h-1) * w;
  int yp1ofs = 0;
  for (int y=h; y-->0;) {
    int xm1ofs = w-2;
    int xofs = w-1;  
    int xp1ofs = 0;
    for (int x=w; x-->0;) {
      t[yofs+xofs] =
        (((((s[yofs + xofs] & 0x0000FF) << 2) + 
        (s[yofs+xp1ofs] & 0x0000FF) + 
        (s[yofs+xm1ofs] & 0x0000FF) + 
        (s[ym1ofs+xofs] & 0x0000FF) + 
        (s[yp1ofs+xofs] & 0x0000FF)) >>> 3)  & 0xFF) +
        (((((s[yofs + xofs] & 0x00FF00) << 2) + 
        (s[yofs+xp1ofs] & 0x00FF00) + 
        (s[yofs+xm1ofs] & 0x00FF00) + 
        (s[ym1ofs+xofs] & 0x00FF00) + 
        (s[yp1ofs+xofs] & 0x00FF00))  >>> 3)  & 0xFF00) +
        (((((s[yofs + xofs] & 0xFF0000) << 2) + 
        (s[yofs+xp1ofs] & 0xFF0000) + 
        (s[yofs+xm1ofs] & 0xFF0000) + 
        (s[ym1ofs+xofs] & 0xFF0000) + 
        (s[yp1ofs+xofs] & 0xFF0000)) >>> 3)  & 0xFF0000) +
        0xFF000000;
      xm1ofs = xofs;
      xofs = xp1ofs;
      xp1ofs++;
    }
    ym1ofs = yofs;
    yofs = yp1ofs;
    yp1ofs += w;
  }
}
*/


