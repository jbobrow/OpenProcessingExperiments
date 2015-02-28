
                
  ///////////////////////////////////////////
  //                                       //
  //          Pixel-Gas Automaton          //
  //                                       //
  ///////////////////////////////////////////
   
  // (c) Martin Schneider (@bitcraftlab) 2013
         
         
PImage input, img;
boolean allpixels, pause;
int direction, t;

int r = 210;

void setup() {
  size(512, 512);
  input = loadImage("input.png");
  step(input, 1024, true);
  reset();
}

void reset() {
  img = input.get();
  pause = false;
  direction = 1;
  t = 0;
}

void draw() { 
  if(!pause) step(img, 1 * direction, allpixels);
  image(img, 0, 0, width, height);
  text("t =" +t, 10, 20);
}

void step(PImage img, int steps, boolean allpixels) {
  img.loadPixels();
  int[] p = img.pixels;
  int w = img.width, h = img.height;
  int origin = (abs(t) + (steps < 0 ? 1 : 0)) % 2;
  for(int step = 0, n = abs(steps); step < n; step++, origin = 1-origin) {
    for(int y = origin;  y < h-1; y+=2) {  
      for(int x = origin;  x < w-1; x+=2) {
        if(allpixels || dist(x, y, w/2, h/2) < r) {
          int tmp, i = x + y * w;
          tmp = p[i+w+1]; p[i+w+1]= p[i]; p[i] = tmp; 
          tmp = p[i+w]; p[i+w] = p[i+1]; p[i+1] = tmp;
        }
      }
    }
  }
  img.updatePixels();
  t += steps;
}

void keyPressed() {
  switch(key) {
    case ' ': pause =! pause; break;
    case 'a': allpixels = !allpixels; reset(); break;
    case 's': img.save("pixel-gas" + (allpixels ? "" : "-circle" + r) + "-step-" + t +".png"); break;  
    case 'd': direction *= -1; break;
    case 'r': reset(); break;
    case '-': step(img, -1, allpixels); break;
    case '+': step(img, +1, allpixels); break;
  }
}


