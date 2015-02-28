
int num_squares = 200;
int[] x_values = new int[num_squares];
int[] y_values = new int[num_squares]; 
void setup() {
  size(600, 400);
  for (int i = 0; i<x_values.length; i++) {
    x_values[i] = int( random(width) );
    y_values[i] = int( random(height) );
  }
}
void draw() {
  background(40, 200, 140);
  for (int i = 0; i<x_values.length; i++) {
    rect(x_values[i]+(mouseX*.005)*i, y_values[i], 30, 30);
  }
}
