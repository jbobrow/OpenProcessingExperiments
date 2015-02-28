
int rows = 20;
int cols = 12;
float rot = 0;

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
}

void draw() { 
  background(255);

  translate(55, 30);

  for (int c = 0; c < cols; c++ ) { 
    for (int r = 0; r < rows; r++) {
      squares[c][r].display();
    }
  }

  if (mousePressed) {
    for (int r = 0; r < rows; r++ ) {
      for (int c = 0; c < cols; c++) {
        squares[c][r].fall((r+10)/4);
        squares[c][r].spin(r*3+1);
        squares[c][r].display();
      }
    }
  }
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
    theta = radians(rand);
  }
  void fall(int i) {
    ypos+=random(i);
  }
}



