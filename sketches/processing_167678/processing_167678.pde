
/* @pjs preload="dog.png"; */
/* @pjs preload="poo1.png"; */
PImage Img1;
PImage Img2;
void setup() { 
  frameRate(15);
  background(255);
  size(800, 500); 
  smooth(); 
  Img1 = loadImage("dog.png");
  Img2 = loadImage("poo1.png");
  cursor(Img1, mouseX, mouseY+20);
}

void draw() {
  int w=Img2.width;
  int h=Img2.height;
  if (mousePressed==true) {
    float a=random(0.5,1.2);
    image(Img2, mouseX+120, mouseY+30,w*a,h*a); 
  }
}



