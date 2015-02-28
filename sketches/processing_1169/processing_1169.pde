
long count;
int[] widths;

void setup() {
  size(640, 360, P2D);
  stop = false;
  saved = false;
  actual = 0;
  count = 0;
  widths = new int[height];
  background(255);
}

int reset = 32;
boolean stop, saved;
int actual;
void draw() {
  if(!stop) {
    for(int i = 0; i < 1024; i++) {
      addCount();
      if(actual % reset == 0)
        count >>= 1;
      actual++;
    }
  }
}

void addCount() {
  int y = getLowesti();
  int curWidth = binaryLength(count);
  for(int i = 0; i < curWidth; i++) {
    set(widths[y] + i, y, ((1 << i) & count) == 0 ? color(0) : color(255));
  }
  widths[y] += curWidth;
  count++;
  if(widths[y] > width) {
    stop = true;
  }
}

int binaryLength(long x) {
  if(x == 0)
    return 1;
  return 1 + (int) (log(x) / log(2));
}

int getLowesti() {
  int lowest = Integer.MAX_VALUE;
  int lowesti = 0;
  for(int i = 0; i < height; i++) {
    if(widths[i] < lowest) {
      lowest = widths[i];
      lowesti = i;
    }
  }
  return lowesti;
}

void mouseClicked() {
  reset = mouseX;
  setup();
}

