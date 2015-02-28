

int y = 250;
int rtran = 20;
int btran = 40;
int r = 450;
int b = 100;
int distance = 100;
int rlarge = -1;
int blarge = 0;                             

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  b += blarge;                             
  r += rlarge;
  if (r < 10) {                            
    rlarge = 1;
  }
  
  if ((r > 450) && (blarge == 0)) {
    blarge = 1;
    rlarge = 0;
  }
  if (b > 460) {
    blarge = -1;
  }
  if (b < 100) {
    exit();
  }
  background(255);
  for (int i = 25; i < width; i += r) {
    fill(255, 0, 0, rtran);
    ellipse(i, y, i, i);
    ellipse(y, i, i, i);
    ellipse(width-i, y, i, i);
    ellipse(y, height-i, i, i);
  }
  for (int i = 50; i < width; i += distance) {
    fill(0, 0, 255, btran);
    ellipse(i, y, b, b);
    ellipse(y, i, b, b);
  }
}


