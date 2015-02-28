
Cell[][] grilla;
int cols=85;
int rows=32;

void setup() {
  
  size (850, 320);
  smooth();
  int w=width/cols;
  int h=height/rows;
  grilla = new Cell[cols][rows];
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      grilla[i][j]= new Cell(i*w, j*h, w, h);
    }
  }
}

void draw() {
  background(255);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      grilla[i][j].display();
    }
  }
}

void mousePressed() {
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      grilla[i][j].click(mouseX, mouseY);
    }
  }
}

class Cell {
  float x, y;
  float h, w;
  int state;

  Cell (float tempX, float tempY, float tempW, float tempH) {
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    state = int(random(5));
  }

  void display() {
    //stroke(0);
    fill(255);
    rect(x, y, h, w);

    if (state==0) {
      noStroke();
      fill(7, 0, 28);
      ellipse(x+w/2, y+h/2, w, h);
    }

    if (state==1) {
      noStroke();
      fill(8, 12, 59);
      ellipse(x+w/2, y+h/2, w, h);
    }

    if (state==2) {
      noStroke();
      fill(238, 43, 67);
      ellipse(x+w/2, y+h/2, w, h);
    }

    if (state==3) {
      noStroke();
      fill(206, 26, 83);
      ellipse(x+w/2, y+h/2, w, h);
    }
  if (state==4) {
    noStroke();
    fill(223, 185, 133);
    ellipse(x+w/2, y+h/2, w, h);
  }
}

void click(int mx, int my) {
  if (mx>x && mx<x+w && my>y && my<y+h) {
    state= (state+1)%5;
  }
}
}
