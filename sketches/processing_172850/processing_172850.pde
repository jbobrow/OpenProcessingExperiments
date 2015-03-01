
import java.util.Random;

Random generator;

float mul;
int count;

void setup() {
  size(500, 500);
  background(0);
  generator = new Random();
  noStroke();
  frameRate(1600);
  smooth();
  mul = 10;
  count = 0;
}

void draw() {
  float h = (float) generator.nextGaussian();
  float h2 = (float) generator.nextGaussian();
  h *= 120;
  color c = color(abs(h), abs(h*h2), h2*350); 
  //println(h);
  fill(c);
  h2 *= 120;
  noStroke();
  //rect(height/2, width/2, h, h);
  //rect(height/2, width/2, -h, h);
  //rect(height/2, width/2, -h, -h);
  //rect(height/2, width/2, -h2, h2);
  //ellipse(height/2, width/2, h, -h2);
  stroke(c);
  //strokeWeight(abs(h)/200);
  strokeWeight(abs(h)/200*abs(mul)/70);
  h /= 6;
  //if (int(mul) % 52 == 0) {
  //h /= mul/300;
  //h2 /= mul/200;
  //}
  h2 /= 2;

  for (int z=0; z<2; z++) {
    point(width/2 + h, height/2 + h2); // vertical
    point(width/2 - h, height/2 - h2);
    point(width/2 + h2, height/2 + h); // horizontal
    point(width/2 - h2, height/2 - h);
  }

  float x1 = sin(h+mul/4)*mul;
  float x2 = sin(h2+mul/4)*mul;
  point(width/2 - x2, height/2 - x1); // Square
  point(width/2 - x1, height/2 - x2);
  point(width/2 + x1, height/2 + x2);
  point(width/2 + x2, height/2 + x1);

  //println(mul);
  //println("count: "+count);
  if (mul < 10) {
    mul = 10;
  }
  if (mul < 90) {
    mul += 0.05;
  } else {
    //mul += 0.002 - h/h2;
    mul += 0.002;
  }
  if (mul >= height*width) {
    mul = 0;
  }
  filter(POSTERIZE, 40);
  count += 1;
  if (count > 4500) {
  }
}

void mousePressed() {
  setup();
}

