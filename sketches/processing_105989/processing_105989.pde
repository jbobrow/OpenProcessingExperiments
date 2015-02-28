
int arraySize = 10;
float gravity = 0.1;

float[] x = new float [arraySize];
float[] y = new float [arraySize];
float[] xSpeed = new float [arraySize];
float[] ySpeed = new float [arraySize];
float[] rad = new float[arraySize];
boolean stop = false;


void setup() {
  size(800, 600);
  smooth();
  //fills the array
  for (int i = 0; i < arraySize; i++) {
    rad[i] = random(10, 30);
    x[i] = random(0+rad[i], width-rad[i]);
    y[i] = random(0+rad[i], height-rad[i]);
    xSpeed[i] = int(random(1, 8));
    ySpeed[i] = int(random(1, 8));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < arraySize; i ++) {
    if (stop) //checks if mouse was pressed
    {
    }
    else {

      //---
       for ( int j = i; j < arraySize; j++) {
      
      //
      if (i != j) {
        float distance = dist(x[i], y[i], x[j], y[j]);

        if (distance <= (rad[i]+rad[j]) ) {
          y[i] -= ySpeed[i]*2.0;  

          ySpeed[i] *= -1;
          ySpeed[j] *= -1;
        } 

        if (distance <= (rad[i]+rad[j]) ) {
          x[i] -= xSpeed[i]*2.0;  

          xSpeed[i] *= -1;
          xSpeed[j] *= -1;
        }
      }
    }
      //---
      x[i] = x[i] + xSpeed[i];
      y[i] = y[i] + ySpeed[i];
      ySpeed[i] += gravity;

      //Right
      if (x[i] >= width) {
        xSpeed[i] = xSpeed[i] * -1;
      }
      //left
      if (x[i] <= 0 ) {
        xSpeed[i] = xSpeed[i] * -1;
      }
      //top
      if (y[i] >= height) {
        ySpeed[i] = ySpeed[i] * -1;
      }


      //bottom
      if (y[i] <= 0) {
        ySpeed[i] = ySpeed[i] * -1;
      }
      //bottom
      if (x[i] <= width/2) {

        //this will papens if this is true
        fill(18, 182, 255, 100);//transparent blue
      } 
      else {
        //  otherwise do this  
        fill(0, 229, 28, 200); //transparent green
      }
    } 
    ellipse(x[i], y[i], rad[i]*2.0, rad[i]*2.0);
  }
}

void mousePressed() {
  stop = !stop;
}
