
int[] x = {
  15, 45, 75, 105, 135, 165, 195, 225, 255, 285, 315, 345, 375, 405, 435, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 435, 405, 375, 345, 315, 285, 255, 225, 195, 165, 135, 105, 75, 45, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15
};

int [] y = {
  15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 45, 75, 105, 135, 165, 195, 225, 255, 285, 315, 345, 375, 405, 435, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 465, 435, 405, 375, 345, 315, 285, 255, 225, 195, 165, 135, 105, 75, 45, 15
}; 
int [] z = {
  43, 56, 16, 33, 58, 54, 22, 50, 52, 29, 53, 59, 8, 32, 44, 42, 47, 14, 30, 5, 20, 19, 38, 45, 36, 55, 34, 37, 1, 39, 51, 31, 48, 57, 12, 7, 11, 40, 6, 2, 15, 35, 13, 41, 9, 18, 27, 46, 49, 17, 4, 10, 3, 26, 25, 21, 0, 23, 24, 28
}; // array that references points in another array so that there are not duplicates for the minute lines

int s;
int m;
int h;

void setup() {
  size (480, 480);
  smooth();
  s = second();
  m = minute();
  h = hour();
}

void draw() {
  s = second();
  m = minute();
  h = hour();
  background(162, 232, 219);

  for (int i = 0; i < m; i++) { //creates the minute lines from the center to the centers of the second circles
    stroke(67, 70, 69);
    line(x[z[i]], y[z[i]], width/2, height/2);
  }

  for (int i = 0; i <= s; i++) { //draws new ellipse every second, by intervals of one second
    //fill(x[i], y[i], 100);
    stroke(255);
    fill(255, 90);
    ellipse(x[i], y[i], 15, 15); //draws x and y coordinates from array, and updated every second
  }

  if (h <= 12) { //draws hours circles in the center of the screen from 1-12 AM, color is green
    for (int i = 0; i < h; i++) {
      //stroke(143, 193, 20);
      stroke(255);
      fill(163, 216, 31, 50);
      //noFill();
      ellipse (width/2, height/2, 80+i*20, 80+i*20);
    }
  } 

  else { //draws hours circles in center of screen from 13-24, color is orange
    for (int i=0; i < h-12; i++) {
      //stroke(216, 108, 0);
      stroke(255);
      fill(234, 138, 19, 50);
      // noFill();
      //ellipse (width/2, height/2, 80+i*20, 80+i*20);
      ellipse (width/2, height/2, 320-i*20, 320-i*20);
    }
  }
}
                
                
