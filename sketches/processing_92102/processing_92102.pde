
//I got this template from http://www.funprogramming.org/58-Travel-through-space-use-an-array-to-move-stars.html

float[] x = new float[150];
float[] y = new float[150];
float[] speed = new float[150];

//I used arrays the little "[]" so that I wouldn't have to copy
//and paste each of my variables 150 times.


void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  noCursor(); //so that mouse doesn't appear on screen

  int i = 0;
  while(i < 100) {  
    //the little balls moving to create a space like thing.
    x[i] = random(0, width); 
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    i = i + 1;
  }
}

void draw() {
  background(0);
  
triangle(mouseX, mouseY-4, mouseX, mouseY+4, mouseX+20, mouseY);
  
  int i = 0;
  while(i < 100) {
    strokeWeight (speed [i]); //I put the stroke weight here to make the smaller dots go slower. I used the variable i because because it determines the speed on the top from 1-5.
    point(x[i], y[i]);
  
    x[i] = x[i] - speed[i] /2; //to move the stars slower.
    if(x[i] < 0) {
      x[i] = width;
    }
    i = i + 1;
  }
}


