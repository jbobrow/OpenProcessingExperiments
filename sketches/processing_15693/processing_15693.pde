
PImage img1;
PImage img2;
PImage img3;
void setup(){
  size (800, 800);
  background (225,225);
  img1  = loadImage ("lacey0004.jpg");
  img2 = loadImage ("lacey0006.jpg");
  img3 = loadImage ("lacey0003.jpg");
}
void draw(){
  tint(150,50,55,100);
  image(img1,5,5);
  tint(120,110,59,90);
  image(img2,5,5);
  tint(200,180,99,100);
  image(img3,5,5);
}

