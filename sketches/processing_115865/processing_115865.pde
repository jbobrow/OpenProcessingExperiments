

PImage[] img = new PImage[20]; 
int copy = 50 ; 

void setup() {
  size(800, 500); 
  background(#75BFB2);
  for (int i = 1; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
}
void draw() {

  float r = random(300, 500); 
  for (int i = 1; i < 20; i ++) {
    image(img[i], copy*i, r);
  }

  image(img[10], mouseX, mouseY);
}

void keyPressed() {
  saveFrame("_######.png");
}



