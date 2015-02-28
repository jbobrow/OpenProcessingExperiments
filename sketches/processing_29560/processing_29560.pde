
Square square;
ArrayList squares;


void setup() {
  size(300, 800);
  colorMode(HSB);
  noStroke();
  rectMode(CENTER);
  squares = new ArrayList();
  frameRate(60);
  for (int i = 0; i < 60; i++) {
      squares.add(new Square(width/2, height - i*10 -100, i*256/60, i, i));
      Square square = (Square) squares.get(squares.size()-1);
      square.init();
      }
}

void draw() {
  background(0);
  for (int i = 0; i < squares.size(); i++) {
      Square square = (Square) squares.get(i);
      square.display();
      square.move();
      }
}

class Square {
  float x, y;
  float c;
  float amplitude;
  float rp;
  float x0, y0;
  
  Square(float _x, float _y, float _c, float _amplitude, float _rp) {
    x = _x;
    y = _y;
    c = _c;
    amplitude = _amplitude;
    rp = _rp;
  }
  
  void init() {
    x0 = x;
    y0 = y;
  }
  
  void move() {
    x = x0 + amplitude*sin(2*(0.001*millis()%60)*rp*PI/60);
    y = y0 + -amplitude*tan((0.001*millis()%60)*rp*PI/60);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(c, 204, 204);
    rect(0, 0, 3, 3);
    popMatrix();
  }
}
                                
