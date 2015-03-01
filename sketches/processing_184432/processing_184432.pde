
void setup() {

  size(500, 500);
}


void draw() {

  for (int x = 15; x < 485; x = x + 40) { //Defines the width value, how long this will run, and sets the width spacing between each square
    for (int y = 15; y < 485; y = y + 40) { //Defines the height value, how long this will run, and sets the height spacing between each square
      rect(x, y, 30, 30); // sets the starting point and dimensions of the first square
      
    }
  }
}



