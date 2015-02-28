
PImage img1;
PImage img2;
PImage img3;
PImage img4;


void setup() {
  size(500, 400);
  noCursor();

  img1=loadImage("yorcki.jpg");
  img2=loadImage("yorcki2.jpg");
  img3=loadImage("f1.png");
  img4=loadImage("f2.png");
 
 
} 


void draw() {
  image(img1, 0, 0);
  
  
  image(img3, mouseX, mouseY);
  if (mousePressed) {
    image(img2,0,0);
    image(img4, mouseX, mouseY);
  }
  
}


