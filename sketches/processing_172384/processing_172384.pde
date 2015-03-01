
int[][] tiles;
int w, h, p;

void setup() {
  strokeWeight(9);
  size(800, 600);
  p = 10;
  w = int(width/p); 
  h = int(height/p);
  tiles = new int[h][w];
}
float xoff = 0.0;

void draw() {
  background(255);
  
  for (int i = 0; i < w; i++) for (int j = 0; j < h; j++) {
    tiles[j][i] = 0;
  }  
  
  for (int i = 0; i < w; i++) {
    float y1 = h-noise(i*0.01+xoff)*h*.8;
    float y2 = y1 + noise(i*0.005+xoff)*h*0.2;
    for (int j = h-1; j > y1; j--) {
      tiles[j][i] = 1;
    }
    for (int k = h-1; k > y2; k--) {
      tiles[k][i] = 2;
    }
  }

  for (int i = 0; i < w; i++) for (int j = 0; j < h; j++) {
    if (tiles[j][i] == 0) fill(0, 0, 255);
    if (tiles[j][i] == 1) fill(0, 255, 0);
    if (tiles[j][i] == 2) fill(255, 0, 0);
    rect(i*p, j*p, p, p);
  }
  
  xoff += 0.2;
}

