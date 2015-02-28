
PImage img0, img1, img2, img3; 
float a =0; 
void setup() {
  size(800, 500); 
  background(255); 
  img0 = loadImage("8.png");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
}
void draw() {
  pushMatrix();
  translate( width/2, height/2); 
  rotate(a); 
  image(img2, 0, 0);
  popMatrix(); 
  a =a +0.01;
}
void keyPressed() {
  saveFrame("img-####.png");
}



