
float i;

void setup() {
  size(600, 600);
  i = 0;
}

void draw() {
  i++;
  float j = 0;
  for(int x = 0; x < width; ++x) {
    for(int y = 0; y < height; ++y) {
      j++;
      set(x, y, (j % i < 15 ? 0 : color(255)));
    } 
  }
}


