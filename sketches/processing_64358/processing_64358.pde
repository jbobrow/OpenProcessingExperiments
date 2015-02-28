
float x_value;
int colorRed = 255;
int colorGreen = 255;
int colorBlue = 255;


void setup() {
  size(400, 400);
  background(0);
  stroke(255);
}

void draw() {
  if(keyPressed == true) {

  if (key == 'x') {
      colorRed -= 5;
      colorGreen -= 5;
      colorBlue -= 5;
    }
    if (key == 'r') {
      colorRed += 5;
    }
    if (key == 'g') {
      colorGreen += 5;
    }
    if (key == 'b') {
      colorBlue += 5;
    }
  }

  stroke(colorRed, colorGreen, colorBlue);
  x_value = (x_value+20) % 400;
  line(x_value, 100, x_value+15, 300);
}

