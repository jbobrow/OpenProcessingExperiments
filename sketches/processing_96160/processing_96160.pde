
int w = 500;
int h = 500;
int y;

void setup() {
  size(500, 500, P2D); 
  y = 1;
  loadPixels();
  for (int i = 0; i < w*h ; i++) {
    int tempr = int(random(2));
    switch (tempr) {
    case 0:
      pixels[i] = color(0);
      break;
    case 1:
      pixels[i] = color(255);
      break;
    }
  }
  updatePixels();
}

void draw() {

  for (int i = 1; i < w-1 ; i++) {
    int life = y * w + i;  
    int volk = 0;

    if (pixels[life+1]  == color(0)) volk++;
    if (pixels[life-1]  == color(0)) volk++;
    if (pixels[life+w]  == color(0)) volk++;
    if (pixels[life-w]  == color(0)) volk++;
    if (pixels[life+1+w]  == color(0)) volk++;
    if (pixels[life+1-w]  == color(0)) volk++;
    if (pixels[life-1+w]  == color(0)) volk++;
    if (pixels[life-1-w]  == color(0)) volk++;

    if (pixels[life] == color(0)) { 
      if (volk < 2 || volk > 3) {
        pixels[life] = color(255);
      }
    }
    
    if (pixels[life] == color(255)) { 
      if (volk== 3) {
        pixels[life] = color(0);
      }
    }
  }
  updatePixels();
  y ++;
  if (y > h - 2) {
    y = 1;
  }
}



