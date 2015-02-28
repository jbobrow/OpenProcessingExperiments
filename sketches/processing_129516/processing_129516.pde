
PImage img1;
PImage img2;
PImage img3;
int flag = 0;
 
void setup() {
  size(450, 450);
  background(231,245,128);
  tint(0);
  img1 = loadImage("apple1.png");
  img2 = loadImage("apple2.png");
  img3 = loadImage("flower.png");
  image(img1, 300, 150);
}
 
 
void draw() {
  background(231,245,128);
  image(img1, 90, 70);
}
 
void mousePressed() {
  tint(85, 63, 110);
   image(img2, 90, 70);
}
 
void mouseReleased() {
 tint(218,123,208);
  image(img2, 90, 70);
}
void mouseDragged() {
 
  for (int x = 0; x <= width; x +=300) {
    for (int y = 0; y <= width; y += 300) {
      image(img3, x, y);
    }
  }
 
  
}



