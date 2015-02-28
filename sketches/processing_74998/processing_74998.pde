
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
 
int imgCount = 0;
 
void setup() {
  size(800, 400);
  
 
  img = loadImage("jaja.jpg");
  img1 = loadImage("jajeoko.jpg");
  img2 = loadImage("pile.jpg");
  img3 = loadImage("kok.jpg");
  img4 = loadImage("coocked.jpg");
}
 
void draw() {
  if(mousePressed){
    imgCount = 0;
  }
   if (mouseX > 133 && mouseX < 250 && mouseY > 70 && mouseY < 190 && mousePressed) {
    imgCount = 1;
  }
   if (mouseX > 250 && mouseX < 370 && mouseY > 60 && mouseY < 200 && mousePressed) {
    imgCount = 2;
  }
   if (mouseX > 371 && mouseX < 510 && mouseY > 83 && mouseY < 200 && mousePressed) {
    imgCount = 3;
  }
   if (mouseX > 511 && mouseX < 625 && mouseY > 58 && mouseY < 200 && mousePressed) {
    imgCount = 4;
  }
   
  image(img, 0, 0);
   
   if (imgCount == 1) {
    image(img1, 0, 200);
  }
   if(imgCount == 2){
    image(img2, 200, 210);
  }
   if(imgCount == 3) {
    image(img3, 330, 210);
  }
   if(imgCount == 4) {
    image(img4, 598, 200);
  }
}



