
int row = 11; //a number of row
float frames = 48;
float gap, offset;
DrawLine[] lines = new DrawLine[row*row];

void setup() {
  frameRate(24);
  size(500, 500);
  background(0);

  gap = width/(row-1);
  offset = gap/2;

  for (int y=0; y<row; y++) {
    for (int x=0; x<row; x++) {
      lines[y*row+x] = new DrawLine(x, y);
    }
  }
}

void draw() {
  //fade to black
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  for (int y=0; y<row; y++) {
    for (int x=0; x<row; x++) {
      lines[y*row+x].move();
      lines[y*row+x].update();
    }
  }
  //  saveFrame("render/render_####.tif");
}

class DrawLine {
  float oriX, oriY;
  float x, y;
  float px, py;
  DrawLine(float _x, float _y) {
    oriX = _x*gap-offset; //position
    oriY = _y*gap-offset;
    x = oriX; //shift amount
    y = oriY;
    px = x; //preframe shift amount
    py = y;
  }

  void move() {
    float theta = frameCount*TWO_PI/frames; //48fr per 1cycle

    float myNoise = noise(oriX/50+cos(theta), oriY/50+sin(theta));
    x =  oriX + 30 * cos(theta+x/gap/10) +myNoise*50; //rotate + random move
    y =  oriY + 30 * sin(theta+y/gap/10) +myNoise*50; //rotate + random move
  }

  void update() {
    stroke(map(x, 0, width, 0, 255), map(y, 0, width, 0, 255), 128);
    strokeWeight(55);
    line(px, py, x, y);
    px = x;
    py = y;
  }
}

