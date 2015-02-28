

int num = 75 ; // num is the number of bars in the looping barcode
float[] y = new float[num]; 

void setup() {
  size(300, 300);
  frameRate(20);//speed of the barcode
  smooth();

  // seed the array
  for (int i = 0; i < y.length; i++) {
    y[i] = random(width);
  }
}

void draw() {
  background(255);

  // controls the bar sizes loop
  for (int i = 0; i<y.length;i++) {

    fill(0);
    rect(y[2], (width/y.length)* y[i], 300, 10);

    y[i] = y[i]+1; // y index in the array to move the bars
    if (y[i] > width/2) y[i] = -10; //resets the bars if passes half the screen
  }
}


