
void setup() {
  size(500, 500);  
  smooth();
}

void draw() {
  background(0);
  int space = 50; 
  for (int col = 1; col <= 9; col++) {
    for (int row = 1; row <= 9; row++) {
      fill(90, 218, 222, 255-(25*row));
      ellipse(space*col, space*row, 4*col, 4*col);
    }
  }
}
                
                
