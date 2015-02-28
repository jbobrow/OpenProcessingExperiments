
int num = 4000;
float[] x = new float[num];
float[] y = new float[num];
PImage img;

void setup() {
  img = loadImage("logo_plain.jpg");
  size(500, 150);
  colorMode(HSB,360,100,100);
  for (int i=0; i<num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {
  background(0);
  //image(img,0,0);
  for(int i=0; i<num; i++) {
    color c = img.get(int(x[i]), int(y[i]));
    float b = brightness(c) / 255.0;
    float speed = pow(b,2) + 0.05;
    x[i] += speed;
    if (x[i] > width) {
      x[i] = 0;
      y[i] = random(height);
    }
    if (speed > 0.1) {
      stroke(40,100,100);
    } else {
      stroke(140,100,100);
    }
    point(x[i],y[i]);
  }
}

