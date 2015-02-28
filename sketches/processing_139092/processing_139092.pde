
int num = 10;
int stepY = num*4;
int step=50;
float sz = 4;
int[] startx = new int[num];
float theta, offset, x, y, starty;

int[] col = new int[num];

void setup() {
  size(500, 300);
  colorMode(HSB, 360, 100, 100);
  for (int i=0; i<num; i++) {
    startx[i] = step*(i+1);
    col[i] = (360/num)*i;
  }
}

void draw() {
  background(20);
  noStroke();

  for (int i=0; i<startx.length; i++) {
    for (int x = startx[i]; x<startx[i]+width; x++) {
      offset = (TWO_PI/width)*x;
      starty =  map(i, 0, startx.length, -stepY, stepY);
      float y = height/2 + starty + map(sin(theta+offset), -1, 1, -stepY, stepY);
      fill(col[i], 90, 90);
      ellipse(x, y, sz, sz);
    }
  }

  theta += 0.0523;

}

