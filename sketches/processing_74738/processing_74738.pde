
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(340, 350);
  
  img = loadImage("");
  img2 = loadImage("");
  img3 = loadImage("");
  img4 = loadImage("");
}

void draw(){
  //image variable (imageVariable, x, y);
  image(img, 250, mouseY/2, 250, 250);
  image(img2, 0, mouseY/2, 250, 250);
  image(img3, mouseX/2, 250, 250, 250);
  image(img4, mouseX/2, 0, 250, 250);
}


