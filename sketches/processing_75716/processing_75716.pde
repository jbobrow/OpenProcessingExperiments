
PImage img1;
PImage img2;
PImage img3;
PImage img4;
 
void setup() {
  size(500, 500);
 
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");
}
 
void draw() {
  colorMode(HSB, 500); 
  background(0, 255, mouseX+mouseY/2);
   
  image(img1, 250, mouseY/2, 250, 250);
  image(img2, 0, mouseY/2, 250, 250);
  image(img4, mouseX/2, 250, 250, 250);
  image(img3, mouseX/2, 0, 250, 250);
 
 
  if (mousePressed) {
 
    image(img1, 250, mouseY/2, 250, 250);
    image(img4, 0, mouseY/2, 250, 250);
    image(img2, mouseX/2, 250, 250, 250);
    image(img3, mouseX/2, 0, 250, 250);
  }
}



