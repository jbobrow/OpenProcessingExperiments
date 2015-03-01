
int[][] buffers;
int prev = 0;
int curr = 1;
int w = 5;
int count;

void setup() {
  size(800, 400);

  count = width/w;
  buffers = new int[2][count];
  for (int i=0; i<count; i++) {
    buffers[prev][i] = 200;
    buffers[curr][i] = 200;
  }
}

int x = 0;
void draw() {
  x = 1-x;
  background(200);
  for (int i=1; i<count-1; i++) {
    int h = (buffers[prev][i-1]+buffers[prev][i+1])-buffers[curr][i];
    h += (200-h)/16;
    buffers[curr][i] = h;
    if (i%2==x)
      rect(i*w, height-h, w, h);
  }
  int tmp = prev;
  prev = curr;
  curr = tmp;
}

void mouseClicked() {
  buffers[prev][mouseX/w] = mouseY;
}

