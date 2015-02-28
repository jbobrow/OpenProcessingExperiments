
int num = 100000;// number of pixels
float[] x = new float[num];
float[] y = new float[num];
PImage img;

void setup() {
  size(500,335);//size of image
  smooth();
  img = loadImage("Celi.jpg");//me and my statue friend 
  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
    stroke(0,0,255);//blue pixels
    //this image has a high amount of blue, so I want to keep this throughout
    //the image starts as two people as the pixels travel one is more dominate than the other
}

void draw() {
    background(255);//white background, image has a bright background
    for (int i = 0; i< num; i++){
      color c = img.get(int(x[i]), int(y[i]));//array along x axis
      float b = brightness(c) / 255.0;
      float speed = pow(random(b), 2) + 0.05;
      x[i] += speed*50;//speed of points traveling

      if (x[i] > width) {
        x[i] = random(width);
        y[i] = random(height);
      }
      point(x[i], y[i]);
    }
  }


