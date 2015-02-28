
int two=300;
int[]x_values=new int[two];
int[]y_values=new int[two];


void setup() {
  size(500, 500);
  background(200);
  frameRate(50);
  for (int i=0; i<x_values.length; i++) {
    x_values[i]=int(random(width));
    y_values[i]=int(random(height));
  }
}

void draw() {
  noFill();
  for (int i=0; i<x_values.length; i++) {
    if (mouseY<250)
    {
      stroke(150, 50);
      ellipse(x_values[i]+(mouseX-250), y_values[i]+(mouseY-250), 30, 30);
    }
    else {
      stroke (255, 64, 0, 50);
      ellipse(x_values[i]+(mouseX-250), y_values[i]+(mouseY-250), 30, 30);
    }  
    if (mouseX<250) {
      stroke (50, 50);
      ellipse(x_values[i]+(mouseX-250), y_values[i]+(mouseY-250), 30, 30);
    }
  }
}
