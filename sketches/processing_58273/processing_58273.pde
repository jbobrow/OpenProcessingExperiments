
float t;
float x;
float y;
float xv;
float yv;
float tt;
float c;
void setup() {
  size(300, 300, P2D);
  x = width / 2;
  y = height / 2;
}
void draw() {
  if(mousePressed) {
    xv += 0.01 * (mouseX - x);
    yv += 0.01 * (mouseY - y);
  }else{
    xv /= 1.1;
    yv /= 1.1;
  }
  float[][] pixi = new float[width][height];
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      t = dist(i, j, mouseX, mouseY);
      tt = dist(i, j, x, y);
      c = t*tt;
      if(c > 100 && c < 120) {
        c = 0;
      }
      pixi[i][j] = 255 - (c / 20);
      c=0;
    }
  }
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      t = pixi[i][j];
      stroke(t, 20 + t, 50 + t*1.2, 255);
      point(i, j);
    }
  }
  x += xv;
  y += yv;
}

