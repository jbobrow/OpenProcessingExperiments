
//Will Cordes
//Assignment 6.2, Lab 6, "Image Data"
//Original Image

//deep red = #AD0909

boolean transition = true;
int grain = 50000; //number of "pixels"
float[] h = new float[grain];
float[] v = new float[grain];
PImage grid;

void setup() {
  size(300, 300);
  grid = loadImage("computational.jpg");
  stroke(#AD0909);
  smooth();
  for (int i = 0;i < grain; i++){
    //seeding the array
    h[i] = random(width);
    v[i] = random(height);
  }
}

void draw() {
  if (transition) {
    background(grid);
  }
  else {
    background(0);
    for (int i = 0; i < grain; i++) {
      color fromImage = grid.get (int(h[i]), int(v[i]));
      float b = brightness(fromImage) /255.0;
      float speed = pow(b, 2) + .05;
      h[i] -= speed; //push to the left
      point (h[i], v[i]); //establishes "pixels"
    }
  }
}

void mousePressed() {
  if (transition) {
    transition = false;
  }
  else {
    transition = true;
  }
}


