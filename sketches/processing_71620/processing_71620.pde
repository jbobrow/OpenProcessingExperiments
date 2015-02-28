
//this is modded from www.learningprocessing.com
//it shows how to create and call your own function

int i = 0;
void setup() { 
  size(100, 100); 
}

void draw() { 
  background(125);
  i= (i+1) % width;
  diagonals(40, 90); 
  diagonals(60, 62); 
  diagonals(20, 40);
}

void diagonals(int x, int y) {
  line(x, y, i, i);
}


