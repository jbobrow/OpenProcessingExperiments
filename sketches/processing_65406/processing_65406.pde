
PImage img1;
PImage img2;
PImage img3;
PImage img4;
 
void setup() {
  smooth();
  
  size(400, 400);
   
  img1 = loadImage("1.jpg");
  img2 = loadImage("wurst.png");
  img3 = loadImage("2_R.png");
  img4 = loadImage("meer_dunkel.jpg");
}
 
void draw() {
 noCursor();
 
  image(img4, 0, 0);
 
  if (mousePressed) {image(img1, 0, 0);image(img2, mouseX, mouseY);}
  else {image(img3, mouseX, mouseY);}

}


