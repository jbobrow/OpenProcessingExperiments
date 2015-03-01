
//Julia Peterson
//Alleged Art

float[][] circleSize = new float[5][5]; //the size of the circle
float[][] speed = {{0.5, 0.5, 0.5, 0.5, 0.5}, //how fast the circle
                   {0.5, 0.5, 0.5, 0.5, 0.5}, //grows and shrinks
                   {0.5, 0.5, 0.5, 0.5, 0.5},
                   {0.5, 0.5, 0.5, 0.5, 0.5},
                   {0.5, 0.5, 0.5, 0.5, 0.5}};
float minSize = 1.0; //the minimum size of the circle
float maxSize = 139.5; //the maximum size of the circle

void setup() {  //sets window size, smoothes edges, removes stroke
  size(800, 800);
  smooth();
  noStroke(); 
  rectMode(CENTER);  //sets rect mode

  //starts the flashing circles at the minimum size
  for (int y = 0; y < 5; y++) { 
    for (int x = 0; x < 5; x++) {
      circleSize[y][x] = minSize;
    }
  }
}

//creates the flashing circles
void flashingCircle() {
  for (int y = 0; y < 5; y++) {    //vertical rows
    for (int x = 0; x < 5; x++) {    //horizontal rows
      circleSize[y][x] += speed[y][x]; //varies the size
      if (circleSize[y][x] > maxSize || circleSize[y][x] < minSize)
      {
        speed[y][x] = -speed[y][x];
      } /*scales the circle in the
       opposite direction when it exceeds
       either the minimum or maximum value*/
      fill(178, 140, 191, 190);
      ellipse(x*200, y*200, circleSize[y][x], circleSize[y][x]);
    }
  }
}

//draws a row of big circles
void bigCircle(int x, int y) {
  while (x < 800) {
    fill(#221751);
    ellipse(x, y, 200, 200);
    x = x + 200;
  }
}

//draws a row of little circles in the middle of the big ones
void littleCircle(int x, int y) {
  while (x < 800) {
    fill(#734da2);
    ellipse(x, y, 92, 92);
    x = x + 200;
  }
}

//draws a row of triangles pointed up
void topTriangle(int a, int b, int c, int d, int e, int f) {
  while (a < 800 && c < 800 && e < 800) {
    fill(#3c2a7c);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

//draws a row of triangles pointed to the right
void rightTriangle(int a, int b, int c, int d, int e, int f) {
  while (a < 801 && c < 801 && e < 801) {
    fill(#3c2a7c);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

//draws a row of triangles pointed down
void bottomTriangle(int a, int b, int c, int d, int e, int f) {
  while (a < 800 && c < 800 && e < 800) {
    fill(#3c2a7c);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

//draws a row of triangles pointed left
void leftTriangle(int a, int b, int c, int d, int e, int f) {
  while (a < 801 && c < 801 && e < 801) {
    fill(#3c2a7c);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

/*draws the first of four semi transparent triangles in the smaller
 center circle*/
void star1(int a, int b, int c, int d, int e, int f) {
  while (a < 801 && c < 801 && e < 801) {
    fill(#debbd9, 127);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

/*draws the second of four semi transparent triangles in the smaller
 center circle*/
void star2(int a, int b, int c, int d, int e, int f) {
  while (a < 801 && c < 801 && e < 801) {
    fill(#debbd9, 127);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

/*draws the third of four semi transparent triangles in the smaller
 center circle*/
void star3(int a, int b, int c, int d, int e, int f) {
  while (a < 801 && c < 801 && e < 801) {
    fill(#debbd9, 127);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

/*draws the fourth of four semi transparent triangles in the smaller
 center circle*/
void star4(int a, int b, int c, int d, int e, int f) {
  while (a < 801 && c < 801 && e < 801) {
    fill(#debbd9, 127);
    triangle(a, b, c, d, e, f);
    a = a + 200;
    c = c + 200;
    e = e + 200;
  }
}

void draw() {
  background(0);

  //controls the flashing circles
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 5; x++) {
      //determines how fast the circle grows and shrinks
      circleSize[y][x] += speed[y][x];
      /*reverses direction of scaling when it gets too close to 
       either the minimum or maximum value*/
      if (circleSize[y][x] > maxSize || circleSize[y][x] < minSize)
        speed[y][x] = -speed[y][x];
      fill(170, 222, 203, 127);
      ellipse(x*200, y*200, circleSize[y][x], circleSize[y][x]);
    }
  }

  //first row
  bigCircle(100, 100);
  topTriangle(100, 0, 67, 67, 133, 67);
  rightTriangle(200, 100, 133, 133, 133, 67);
  bottomTriangle(67, 133, 133, 133, 100, 200);
  leftTriangle(0, 100, 67, 67, 67, 133);
  littleCircle(100, 100);

  //second row
  bigCircle(100, 300);
  topTriangle(100, 200, 67, 267, 133, 267);
  leftTriangle(0, 300, 67, 267, 67, 333);
  bottomTriangle(67, 333, 133, 333, 100, 400);
  rightTriangle(200, 300, 133, 333, 133, 267);
  littleCircle(100, 300);

  //third row
  bigCircle(100, 500);
  topTriangle(100, 400, 67, 467, 133, 467);
  leftTriangle(0, 500, 67, 467, 67, 533);
  bottomTriangle(67, 533, 133, 533, 100, 600);
  rightTriangle(200, 500, 133, 533, 133, 467);
  littleCircle(100, 500);

  //fourth row
  bigCircle(100, 700);
  topTriangle(100, 600, 67, 667, 133, 667);
  leftTriangle(0, 700, 67, 667, 67, 733);
  bottomTriangle(67, 733, 133, 733, 100, 800);
  rightTriangle(200, 700, 133, 733, 133, 667);
  littleCircle(100, 700);

  //draws the flashing circles
  flashingCircle();

  //draws centered stars
  //row 1  
  star1(54, 100, 100, 54, 132, 132);
  star2(68, 68, 100, 146, 146, 100);
  star3(54, 100, 100, 146, 132, 68);
  star4(100, 54, 146, 100, 68, 132);
  //row 2  
  star1(54, 300, 100, 254, 132, 332);
  star2(68, 268, 100, 346, 146, 300);
  star3(54, 300, 100, 346, 132, 268);
  star4(100, 254, 146, 300, 68, 332);
  //row 3 
  star1(54, 500, 100, 454, 132, 532);
  star2(68, 468, 100, 546, 146, 500);
  star3(54, 500, 100, 546, 132, 468);
  star4(100, 454, 146, 500, 68, 532);
  //row 4      
  star1(54, 700, 100, 654, 132, 732);
  star2(68, 668, 100, 746, 146, 700);
  star3(54, 700, 100, 746, 132, 668);
  star4(100, 654, 146, 700, 68, 732);
}


