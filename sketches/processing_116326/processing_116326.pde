
//Eunsil Choi 10/18/2013

 
int num_lines = 100;
int num_circles = 100;
int[] x_values = new int[num_lines];
int[] y_values = new int[num_lines];
void setup() {
  size(400, 300);
  smooth();
  for (int i = 0; i<x_values.length; i++) {
    x_values[i] = int( random(width) );
    y_values[i] = int( random(height) );
  }
}
void draw() {
  background(125, 40, 90);
  for (int i = 0; i<x_values.length; i++) {
    stroke(100,100,200);
    line(x_values[i]+(mouseX), y_values[i], width/2, 11);
    stroke(200,100,100);
    line(x_values[i]+(mouseX), y_values[i], width/2, 289);
    stroke(200,200,100);
    line(x_values[i]+(mouseX), y_values[i], 11, height/2);
    line(x_values[i]+(mouseX), y_values[i], 389, height/2);
    noStroke();
    ellipse(x_values[i], y_values[i], 3,3);
    
    x_values[i] += random(1) - .5; //movement of line
    y_values[i] += random(1) - .5; //movement of circle
  }
}

