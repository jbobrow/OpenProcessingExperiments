
int rows = 20;
int cols = 12;
bool beginShatter;

Square[][] squares = new Square[cols][rows];

void setup() {
  size(360, 480);

  smooth();
  //initialization of square array
  for (int c = 0; c < cols; c++ ) { 
    for (int r = 0; r < rows; r++) {
      squares[c][r] = new Square(c*20, r*20);
    }
  }
  beginShatter = false;
  
}

void draw() { 
  background(220);

  translate(55, 30);

  for (int c = 0; c < cols; c++ ) { 
    for (int r = 0; r < rows; r++) {
      squares[c][r].display();
    }
  }

  if (beginShatter) {
    for (int r = 0; r < rows; r++ ) {
      for (int c = 0; c < cols; c++) {
        squares[c][r].fall((r+10)/4);
        squares[c][r].spin(r*3+1);
        squares[c][r].display();
      }
    }
  }
}

void mousePressed() {
    beginShatter = !beginShatter;
}

class Square {
  int xpos;
  int ypos;
  float theta;

  //Square constructor
  Square(int xpos_, int ypos_) { 
    xpos = xpos_;
    ypos = ypos_;
    theta = 0;
  }

  void display() {
    stroke(1);
    noFill();

    pushMatrix();
    translate(xpos,ypos);
    rotate(theta);
    rect(0, 0, 20, 20);
    popMatrix();
  }
  void spin(int i) {
    float rand = random(-i, i);
    theta = 3*radians(rand)/4;
  }
  void fall(int i) {
    ypos+=(random(i))/4;
  }
}

