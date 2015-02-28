

//This sketch uses sets of instructions to randomly place rectangles on a nested grid.
//Each mousepress re-runs the sketch to place new rectangles onto the grid. Their sizes also relate to the grid.
//The relationship between the rectangles and grid is also a figure/ground relationship.
//With each additional mousepress, the composition changes to create different figure/ground
//relationships. The fill of the rectangles is somewhat transparent to allow the underlying
//grid to activate the figures.

void setup() { //sets the background grid that is a triple nested loop
  size(500, 500);
  fill(200);
  for (int countX=0; countX < width/50;countX++) { //grid divides the screen into rectangles, nested inside each other at the top left corner
    for (int countY=0; countY<height/50; countY++) {
      for (int rectSize = 50; rectSize>=5; rectSize-=5) {
        rect(countX * 50, countY * 50, rectSize, rectSize);
      }
    }
  }
  fill(0);// how initial composition is controlled 
  cube();
  fill(100, 75);
  grid1();
}

int countX = 0;//integers to set regulations inside the void grid functions
int countY = 0;
int rectSize = 50;

void grid1() { //grid function that controls the nested rectangles
  for (int countX=0; countX < width/50;countX++) {
    for (int countY=0; countY<height/50; countY++) {
      for (int rectSize = 50; rectSize>=5; rectSize-=5) {
        rect(countX * 50, countY * 50, rectSize, rectSize);
      }
    }
  }
}

void cube() { //function that controls the cubes to be placed on the grid
  for (int countX=0; countX < width/50;countX++) {
    for (int countY=0; countY<height/50; countY++) {
      rect(random(countX+=width/2), random(countY+=height/2), (rectSize*2), (rectSize*2)); 
      rect(random(countX+=width/2), random(countY+=height/2), (rectSize*3), rectSize);
      rect(random(countX+=width/2), random(countY+=height/2), (rectSize), rectSize);
    }
  }
}

void draw() { //
}

void mousePressed() { // everytime the mouse is clicked these instructions must take place
  if (mousePressed == true) {
    countX = 0;
    countY = 0;
    setup();

    fill(0);
    cube();
    fill(100, 75);
    grid1();
  }
}


