
int num = 20000; //number of dots
//make arrays
float[] x = new float[num];  
float[] y = new float[num];  
//add image
PImage img;

void setup() {
  size(300, 300);
  img = loadImage("loud.jpg");

  //seed of dots
  for (int i = 0; i < num; i++) {  
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(255, 0, 0);
}

void draw() {
  background(255);
  for (int i = 0; i < num; i++) {
    color c = img.get(int(x[i]), int(y[i])); // get the color from the picture
    float b = brightness(c) / 255.0; // finding the brightness of each color
    float speed = pow(b, 2) + .2; // setting the speed of the dots
    x[i] += speed; // moving the paticles

    if (x[i] > width) {                       
      x[i] = random(width); // restarting the dots
      y[i] = random(height);
    }
    point(x[i], y[i]);
  }
}


