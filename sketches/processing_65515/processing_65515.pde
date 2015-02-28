
PImage img1;
PImage img2;
PImage img3;
PImage img4;
 
void setup() {
  smooth();
 
  size(280, 235);
   
  img1 = loadImage("luckylukee_.jpg");
  img2 = loadImage("Knall.png");
  img3 = loadImage("lucky-luke_.jpg");
  img4 = loadImage("Rotier.png");
}
 
void draw() {
 
  image(img1,0,0);
 
  if (mousePressed) {
    image(img3, 0, 0);
    image(img2, mouseX, mouseY);
  }
  else {
    image(img4, mouseX, mouseY);
  }
}


