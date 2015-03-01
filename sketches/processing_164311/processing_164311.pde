
int num = 50;
int[] x = new int[num];
int[] y = new int[num];

void setup() {
  size(300,300);
  smooth();
  noStroke();
}

void draw() {
  background(234,44,0);
  //Copy array values from the back to front
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX; // Set the first element
  y[0] = mouseY; //Set the first element
  for (int i = 0; i < x.length; i++) {
    fill(255);
    rect(x[i],y[i],40,40);
  }
}


