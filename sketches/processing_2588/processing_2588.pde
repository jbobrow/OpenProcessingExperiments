
final static int COLS = 50;
final static int SIZE = 15;
final static int RATE = 60;
final static int TIME = RATE * 10; // 5 minutes

int ROWS;
byte[] message;

void setup()
{
  size(800, 500, P2D);
  frameRate(RATE);
  textFont(createFont("Monaco", SIZE));
  message = loadBytes("message.txt");
  ROWS = message.length / COLS + 1;
}

void draw()
{
  background(34);
  translate(width / 2, height / 2);
  for(int i = 0; i < message.length; i++)
  {
    int x = (i % COLS - COLS / 2) * SIZE;
    int y = (i / COLS - ROWS / 2) * SIZE;
    pushMatrix();
    rotate((frameCount - TIME) * (noise(x * 0.1, y * 0.1) - 0.5) * 0.01);
    text(char(message[i]), x, y);
    popMatrix();
  }
}


