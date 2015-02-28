
/*This drawing machine explores the  possible relationships that could occur from the layering of a four square grid and of a nine square grid.
 1. A four square grid and a nine square grid are drawn.
 2. Both grids are halved to create a more complex tartan grid.
 3. In the four square grid, there is a 4/1 probablity that the squares will be blue.
 In the nine square grid, there is a 3/1 probablity that the squares will be red.
 4. In the four square grid, there is a 1/16 probablity that the squares will be black.
 In the nine square grid, there is a 1/18 probablity that the squares will be black*/

void setup() {
  size(500, 500);
  background(0);
}

//Variables for the four square grid.
float spacingA=(50);
float marginA=(50);
float dimensionA=(50);

//Variables for the nine square grid.
float spacingB=(66.666666);
float marginB=(50.0001);
float dimensionB=(66.666666);


void draw() {
}

void mousePressed() {
  noStroke();
  fill(255);
  rect(50, 50, 400, 400);
  fourSquare();
  nineSquare();
}

void fourSquare() {
  for (float x =marginA; x<width-marginA; x+=spacingA) {
    for (float y =marginA; y<height-marginA; y+=spacingA) {
      if (random(4)>1) {
        fill(0, 0, 255, 50);
        rect(x, y, dimensionA, dimensionA);
      }
      else {
        fill(255, 50);
        rect(x, y, dimensionA, dimensionA);
      }
      if (random(16)<1) {
        fill(0);
        rect(x, y, dimensionA, dimensionA);
      }
    }
  }
}

void nineSquare() {
  for (float x =marginB; x<width-marginB; x+=spacingB) {
    for (float y =marginB; y<height-marginB; y+=spacingB) {
      if (random(3)>1) {
        fill(255, 0, 0, 50);
        rect(x, y, dimensionB, dimensionB);
      }
      else {
        fill(255, 50);
        rect(x, y, dimensionB, dimensionB);
      }
      if (random(18)<1) {
        fill(0);
        rect(x, y, dimensionB, dimensionB);
      }
    }
  }
}


