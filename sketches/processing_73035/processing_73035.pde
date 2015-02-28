
int alt;
int [] fibo = new int [30];
int [] operation = new int [30];
int [] x = new int [30];
int [] y = new int [30];
float [] diameter = new float [40];

void setup() {
  size (800, 800);
  background(0);
  smooth();
  stroke(255, 50);
  noFill();
  fibo [0] = 1;
  fibo [1] = 2;
  fibo [2] = 3;
  x [0] = 0;
  x [1] = 1;
  x [2] = 2; 
  y [0] = 0;
  y [1] = -1;
  y [2] = 0; 
  operation [0] = 0;
  operation [1] = 0;
  operation [2] = 1;
  alt = 1;
}

void draw() {
  background(100, 10);
  
  //set up ARRAYS
  for (int i = 3; i < 14; i++) {
    fibo [i] = fibo [i-1] + fibo [i-2];

    //set up alternate + operation
    if ((operation[i-1] > 0 ) && (operation[i-2] == 0)) {
      alt = -1;     
    }
    if ((operation[i-1] < 0 ) && (operation[i-2] > 0)) {
      alt = -1;
    }
    if ((operation[i-1] < 0 ) && (operation[i-2] < 0)) {
      alt = 1;
    }
    if ((operation[i-1] > 0 ) && (operation[i-2] > 0)) {
      alt = -1;
    }

    operation [i] = alt * fibo[i-2] ;

    //x coordinate
    x [i] = x[i-1] + operation[i];
    //y coordinate
    if (i % 2 == 0) {  
      y [i] = y[i-1] + operation[i];
    } 
    else {
      y [i] = y[i-1] - operation[i];
    }


    pushMatrix();

    translate(width/2, height/2);


    for (int j = 0; j < 16; j++) {
      diameter [j] = map(j, 0, 16, 0, 50);
//    strokeWeight (j);
      rotate (PI/8);
      ellipse (x[i], y[i], diameter[i], diameter[i]);
    }

    popMatrix();

  }


}
















