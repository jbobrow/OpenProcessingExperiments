
int arraySize = 100;
int[] x = new int [arraySize];
int[] y = new int [arraySize];
int[] xSpeed = new int [arraySize];
int[] ySpeed = new int [arraySize];
boolean stop = false;


void setup() {
  size(800, 600);
  //fills the array
  for (int i = 0; i < arraySize; i++) {
    x[i] = int(random(100, 200));
    y[i] = int(random(100, 200));
    xSpeed[i] = int(random(1, 8));
    ySpeed[i] = int(random(1, 8));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < arraySize; i ++) {
    if (stop)
    {
    }
    else {

      x[i] = x[i] + xSpeed[i];
      y[i] = y[i] + ySpeed[i];

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
    ellipse(x[i], y[i], 20, 20);
  }
}

void mousePressed() {
  stop = !stop;

  
}
