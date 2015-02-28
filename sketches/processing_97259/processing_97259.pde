

Square [] mySquare = new Square[25];
Square[] myRect = new Square[25];

void setup() {
  size (300, 300);
  for (int i =0; i <myRect.length; i++) {
    myRect[i] = new Square();
  }
  for (int i=0; i<mySquare.length; i++) {
    mySquare[i] = new Square();
  }
}
void draw() {
  background(0);
  for (int i=0;i<mySquare.length; i++) {
    mySquare[i].display();
    mySquare[i].bounce();
  }
  for (int i=0; i<myRect.length; i++) {
    myRect[i].display();
    myRect[i].bounce();
  }
}

class Square {
  color c;
  int x;
  int y;
  int speed;

  Square() {
    c = color(225,0,0);
    x = int(random(0,300));
    y = int(random(0,300));
    speed = int(random(1,10));
  }
  
  void display() {
    fill(175,125, 10);
    rect(x, y, 25, 25);
  }
  void bounce() {
    x += speed;
    if (x < 0 || x >=width) {
      speed = speed * -2;
    }
  }
} 


