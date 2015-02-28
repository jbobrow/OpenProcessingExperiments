
int dim = 20;
final int NUM = 10;
Rectangle[][] rectangles = new Rectangle[NUM][NUM];
color[] colors = new color[NUM];

void setup() {
  size(dim*NUM, dim*NUM);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);

  float x=0, y=0;
  for (int i=0; i<NUM; i++) {
    x = dim * i;
    for (int j=0; j<NUM; j++) {
      y = dim * j;
      rectangles[i][j] = new Rectangle(x, y, dim);
    }
  }

  int colorSeed = 360/NUM;
  for (int i=0; i<NUM; i++) {
    if (i == 0) {
      colors[i] = color(0, 0, 100);
    }
    else {
      colors[i] = color(colorSeed*i, 96, 99);
    }
  }
}

void draw() {
  float x=0, y=0;
  for (int i=0; i<width/dim; i++) {
    x = dim * i;
    for (int j=0; j<height/dim; j++) {
      y = dim * j;
      rectangles[i][j].display();
    }
  }
}

void mouseClicked() {
  Rectangle rectangle;
  for (int i=0; i<NUM; i++) {
    for (int j=0;j<NUM; j++) {
      rectangle = rectangles[i][j];
      if(rectangle.judge()){
        rectangle.countUp();
      }
    }
  }
}

class Rectangle {
  float x, y;
  int dim;
  int cnt;

  Rectangle(float x, float y, int dim) {
    this.x = x;
    this.y = y;
    this.dim = dim;
    this.cnt = 0;
  }

  void countUp() {
    cnt++;
    if (cnt >= NUM) {
      cnt = 0;
    }
  }

  boolean judge() {
    if (mouseX > x && mouseX < x+dim
      && mouseY > y && mouseY < y+dim) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    fill(colors[cnt]);
    rect(x, y, dim, dim);
  }
}


