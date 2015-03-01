
Random generator;

void setup() {
  size(640,480);
  generator = new Random();
  background(0);
}

void draw() {
  float x = gauss(width/2, 60);
  float y = gauss(height/2, 60);
  noStroke();
  fill(gauss(127,127),gauss(127,127),gauss(127,127),100);
  ellipse(x,y,16,16);
}

float gauss(int mean, int deviation){
  float num = (float) generator.nextGaussian();
  return deviation * num + mean;
}
