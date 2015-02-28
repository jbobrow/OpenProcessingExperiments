
import processing.opengl.*;
int count = 100;
float[] xpos = new float[count];
float[] ypos = new float[count];

void setup() {
  size(700, 400, OPENGL);
  stroke(255);
  for (int i = 0; i < count; i++) {
    xpos[i] = random(0, width);
    ypos[i] = 0;
  }
}
void draw() {
  background(0, 127);
  for (int i= 0; i < count; i++) {
    line(xpos[i], ypos[i], xpos[i], 5+ypos[i]);
    ypos[i] = ypos[i] + random(5, 50);
    if (ypos[i]>height) {
      ypos[i] = 1;
      xpos[i] = random(0, width);

      if (mousePressed) {
        background(255);
      }
    }
  }
}


