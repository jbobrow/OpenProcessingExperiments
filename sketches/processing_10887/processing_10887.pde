
float[][] z = new float[99][99];
boolean interact = false;
int W, H;

void setup() {
  size(400, 400);
  colorMode(RGB);

  W = width / (z[0].length+1);
  H = height / (z.length+1);
  
  smooth();

  frameRate(30);
}

void draw() {
  
  background(255,255,255);

  pushMatrix();
  translate(W, H);

  int b;
  for (int y = 0; y < z.length; y++) {
    for (int x = 0; x < z[0].length; x++) {
      pushMatrix();
      translate(x * W, y * H);
      b = (int) max(0, z[y][x]);

      fill(255-b, 255-b, 255);
      stroke(255-b, 255-b, 255);
      float coolDown = (z[y][x] > 10) ? .96 : .9;
      z[y][x] = z[y][x] * coolDown;
      rect(-W/2, -H/2, W-1, H-1);
      
      popMatrix();
    }
  }

  popMatrix();
  
}

void mouseDragged() {
  mouseMoved();
}

void mouseClicked() {
  mouseMoved();
}

void mouseMoved() {

  int x = (mouseX - W/2) / W;
  int y = (mouseY -H/2) / H;

  if (x >= 0 && y >= 0 && x < z[0].length && y < z.length) {  
    z[y][x] += 80;
    z[y][x] = min(255, z[y][x]);
    
    for (int dy = -30; dy <= 30; dy++) {
      for (int dx = -30; dx <= 30; dx++) {
        if (dy == 0 && dx == 0) continue;
        smooth(x, y, dx, dy);
      }
    }
  }
  
}

void smooth(int x, int y, int dx, int dy) {
  if (x + dx < 0 || x + dx >= z[0].length) return;
  if (y + dy < 0 || y + dy >= z.length) return;
    
  z[y+dy][x+dx] += (z[y][x] - z[y+dy][x+dx]) / (dx*dx + dy*dy + 1);
      z[y+dy][x+dx] = min(255, z[y+dy][x+dx]);
}

