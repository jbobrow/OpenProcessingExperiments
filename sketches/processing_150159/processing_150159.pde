
static final int WIDTH = 500;
static final int HEIGHT = 500;
static final int RECT_SIZE = 5;
static final color WHITE = #ffffff;

void setup()
{
  size(WIDTH, HEIGHT);
  reset();
}

void draw()
{
  reset();
  for (int i = 0; i < WIDTH / RECT_SIZE; i++) {
    for (int j = 0; j < HEIGHT / RECT_SIZE; j++) {
      boolean isDraw = floor(random(1.5, 2.4)) == 1;
      if (isDraw) {
        fill(#333333);
        rect(i*RECT_SIZE, j * RECT_SIZE, RECT_SIZE, RECT_SIZE);
      }
    }
  }
  try {
    Thread.sleep(4000);
  } catch (InterruptedException e) {}
}

void reset()
{
  background(WHITE);
}
