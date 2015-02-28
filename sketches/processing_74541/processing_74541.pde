
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(600, 400);
  img = loadImage("pesco.jpg");
  img2 = loadImage("pesco.jpg");
  img3 = loadImage("pesco.jpg");
  img4 = loadImage("pesco.jpg");
}

void draw(){
  image(img, 0, 0, mouseY, mouseY);
  image(img2, width/2, height/2, mouseX, mouseY);
  image(img3, 0, height/2, width/2, mouseY); 
  image(img4, width/2, 0, mouseX, height/2);
  
}
