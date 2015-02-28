
//Created by Dave Ogle, Jonah McLachlan, Will Duncan
//SSPog Snake 
PImage img;
PImage img1;
void setup() {
size(1000,750);
img1 = loadImage("BG.SALT.jpg");
background(img1);
  
img = loadImage("photo1.png");
}

void draw() {
  image(img, mouseX, mouseY);
  if (mousePressed && (mouseButton == LEFT)) {
background(img1);
}
 if (mousePressed && (mouseButton == RIGHT)) {
       img = loadImage("photo2.png");
 }
       else{
         img = loadImage("photo1.png");
       }
 }




