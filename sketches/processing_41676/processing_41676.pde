
int p = 5; //this is for the push (negative space) between the areas
int num = 4; // number of cells in a row
float cell;

void setup () {
  size(400, 400);
  cell =  width/num; // cell size
}


void draw() {
} 

void mousePressed() {
  background(255);
  for (int i = 0; i < cell/p; i++) { // this loop determines the number of cells to draw (e.g. 4 x 4 = 16)
    int count = 0;
    stroke(random(1, 255)); // same stroke for all lines
    for (int y = 0; y < height; y+=cell) {
      if (num % 2 == 0) {
        count++; // if the number of modules in a column is even, add one to count to maintain checker effect
      }
      for (int x = 0; x < width; x+=cell) {
        strokeWeight(random(1, 5)); // random strokeweight for each line
        if (count % 2 == 0) { 
          line(x, y + i*p, x + cell-p, y + i*p); // even numbered cells
        }
        else { 
          line(x + i*p, y, x + i*p, y + cell-p); // odd numbered cells
        }
        count++;
      }
    }
  }
}                                               
