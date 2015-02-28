
PImage[] img = new PImage[10]; 
int copy = 100 ; 

void setup() {
  size(800, 500); 
  frameRate(30);
  background(100,155,200);
  for (int i = 1; i < 10; i ++) {
    img[i] = loadImage( i+".png");
  }
}
void draw() {
  

  float r = random(-100, 500); 
  for (int i = 1; i < 10; i ++) {
    image(img[i], 100*i+random(-100,300), r);
  }



}

void keyPressed() {
  saveFrame("_######.png");
}



