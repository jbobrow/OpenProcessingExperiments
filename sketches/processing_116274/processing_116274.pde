
int num_lines = 200;
int[] x_values = new int[num_lines];
int[] y_values = new int[num_lines];

void setup(){
  size(400,600);
  for (int i = 0; i<x_values.length; i++){
    x_values[i] = int(random(width));
    y_values[i] = int(random(height));
  }
}

void draw() {
  //background(0);
  for (int yPos = 0; yPos <= height; yPos += height) {
    for (int xPos = 0; xPos <= width; xPos = xPos +200) {
  for(int i = 0; i<x_values.length; i++) {
    ellipse(x_values[i]+(mouseX*.002)*i, y_values[i],30, 30);
    fill(random(255), random(255), random(255), random(255));
    noStroke();
  }
}
  }
}
