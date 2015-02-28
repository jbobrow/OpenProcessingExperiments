
int one = 200;
int[]x_values=new int[one];
int[]y_values=new int[one];

void setup() {
  size (600, 600);
  for (int i=0; i<x_values.length; i++) {
    x_values[i]= int(random(width));
    y_values[i]= int(random(height));
  }
}


void draw() {
  background(255, 51, 0);
  stroke(138, 214, 180);
  strokeWeight(1.5);
  for (int i=0; i<x_values.length; i++) {
    if (mouseX <300) {
      stroke(138, 214, 180);

      line(x_values[i]+(mouseX-300), y_values[i]+(mouseY-300), 300, 300);
    }
    else {
      stroke(138, 214, 180);

      line(x_values[i]+(mouseX-300), y_values[i]+(mouseY-300), 50, 50);
    }

    if (mouseY<300) {
      stroke(120);

      line(x_values[i]+(mouseX-300), y_values[i]+(mouseY-300), 300, 300);
    }
    else {
      stroke(75);

      line(x_values[i]+(mouseX-300), y_values[i]+(mouseY-300), 500, 500);
    }
    if (mouseX<100) {
      stroke(138, 214, 180);

      line(x_values[i]+(mouseX-300), y_values[i]+(mouseY-300), 300, 300);
    }
    else {
      stroke(255);
      line(x_values[i]+(mouseX-300), y_values[i]+(mouseY-300), 100, 600);
    }
  }
}
