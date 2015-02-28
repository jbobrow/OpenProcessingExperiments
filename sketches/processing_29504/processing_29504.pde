
Square square;
ArrayList squares;


void setup() {
  size(300, 400);
  colorMode(HSB);
  noStroke();
  rectMode(CENTER);
  squares = new ArrayList();
  frameRate(60);
}

void draw() {
  background(0);
  for (int i = 0; i < squares.size(); i++) {
      Square square = (Square) squares.get(i);
      square.display();
      square.move();
      }
}

void mousePressed() {
  squares.add(new Square(mouseX, mouseY, random(255), random(0.5, 2)));
  Square square = (Square) squares.get(squares.size()-1);
  square.init();
}



class Square {
  float x, y;
  float c;
  float sc;
  float r;
  int t = 0;
  float x0, y0;
  
  Square(float _x, float _y, float _c, float _sc) {
    x = _x;
    y = _y;
    c = _c;
    sc = _sc;
  }
  
  void init() {
    x0 = x;
    y0 = y;
  }
  
  void move() {
    r += 0.01;
    t++;
    x = x0 + 20*sin(t*sc*PI/300);
    y = y0 + -20*tan(t*sc*PI/300);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    scale(sc);
    rotate(r);
    fill(c, 204, 204);
    rect(0, 0, 10, 10);
    popMatrix();
  }
}                               
