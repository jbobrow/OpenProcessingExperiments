
PImage img;

void setup() {
  size (600, 600);
  background(0);
  img = loadImage("loremIpsum.png");
  image(img,0,0);
}

void draw() {
  
  
  float a = 0.0;
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j += 100) {
      noFill();
      stroke(255, 102, 0);
      line(i, j, 80, 5);
      line(j, i,30, 75);
      stroke(random(255), random(255), random(255));
      bezier(i+30, j*20,80, 5, 80, 75, 30, 75);
    }
  }
}



