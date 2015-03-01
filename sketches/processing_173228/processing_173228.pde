
//Interact with this pattern quilt using your mouse position.
//Each of the extreme corners provides a distinct pattern
//Try out each of the corners and try transitioning between them

//Method for Guassian random number generation learned from Daniel Shiffman's Nature of Code

import java.util.*;

Random generator;
Random generator2;
Random generator3;
float cw;//circle width
float ch;//circle height
float t;//noise dimension interpreted as time

void setup() {
  size(600, 600);
  background(0);
  generator = new Random();
  generator2 = new Random();
  generator3 = new Random();
}

void draw() {
  float num = (float) generator.nextGaussian();
  float m = 150;
  float sd = 30;
  float num2 = (float) generator2.nextGaussian();
  float m2 = 150;
  float sd2 = 40;
  float num3 = (float) generator3.nextGaussian();
  float m3 = 120;
  float sd3 = 60;
  

  int r = (int) ((num * sd) + m);
  int g = (int) ((num2 * sd2) + m2);
  int b = (int) ((num3 * sd3) + m3);

  for (int y = 20; y <= height; y += 40) {
    for (int x = 20; x <= width; x += 40) {
      noStroke();
      float a = map(noise(t), 0, 1, 50, 150);
      fill(r, g, b, a);
      float cw = map(mouseX, 0, width, 5, 50);
      float ch = map(mouseY, 0, height, 5, 50);
      ellipse(x, y, cw, ch);
      t += 0.05;
    }
  }
}



