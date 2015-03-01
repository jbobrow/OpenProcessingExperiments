
float inc = 0.06;
int density = 4;
float znoise = 0.0;
void setup() { 
  size(600, 600); 
  noStroke();
}
void draw() {
  float xnoise = 0.0;
  float ynoise = 0.0;
  for (int y = 0; y < height; y +=density) {
    for (int x = 0; x < width; x += density) {
      float n = noise(xnoise, ynoise, znoise) * 256;
      fill(random(70),n/2,n-50);
      ellipse(x, y, density, density);
      xnoise += inc;
    }
    xnoise = 0;
    ynoise += inc;
  }
  znoise += inc+0.1;
}



