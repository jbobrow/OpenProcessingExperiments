
PImage[] img = new PImage[20]; 
int copy = 50 ; 

void setup() {
  size(800, 500); 
  background(0);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".jpg");
  }
}
void draw() {

  float r = random(0, 500); 
  for (int i = 0; i < 20; i ++) {
    image(img[i], copy*i, r);
  }

  image(img[15], mouseX, mouseY);
}

void keyPressed() {
  saveFrame("_######.jpg");
}
