
// SIMONE ROTH - PS 3 # 4 // 

Square[] square = new Square[50];

void setup() {
  size(500, 500);
  smooth();
  background(240);
  noStroke();
  for (int i=0; i < square.length; i++) {
    square[i] = new Square(width/2, height/2, 40, 40);
  }
}

void draw() {
  for (int i=0; i < square.length; i++) {
    square[i].display();
  }
}



