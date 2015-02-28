
PImage[] img = new PImage[20]; 

void setup() {
  size(1200, 900); 
  background(0);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
}
void draw() {
  frameRate(0.5);

  for (int i = 19; i > 11 && i < 20 ; i --) {
    image(img[i], random(-200, 1200), random(-200, 50));
  }

  for (int i = 0; i < 12; i ++) {
    image(img[i], random(-200, 1200), random(100, 600));
  }
  
}

void keyPressed() {
  saveFrame("_######.png");
}


