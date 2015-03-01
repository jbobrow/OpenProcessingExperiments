
// The Museum of All 8X8 B&W Icons
// Levente Sandor, 2014

// Rather philosophical than visual. 
// There are only 18446744073709551616 of them, 
// so if you are patient enough, you have a real chance 
// to find your favourite, even in your lifetime.

int w = 8, h = 8;
int d = 64; // :)
int counterLength = w * h;
int[] counter = new int[counterLength];


void setup() {
  size(w * d, h * d);
  noStroke();
  colorMode(RGB, 1);
}

void draw() {
  int i = 0;
  
  while (i < counterLength && counter[i] == 1) {
    counter[i] = 0;
    i++;
  }
  
  if (i < counterLength) {
    counter[i] = 1;
  }
  
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      fill(counter[y * w + x]);
      rect(x * d, y * d, d, d);
    }
  }
}

