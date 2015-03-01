

PImage img, img1, img2, img3;

void setup() {
  size(960,720);
  // Make a new instance of a PImage by loading an image file
  img= loadImage("bathroom.jpg");
  img1 = loadImage("skull.jpg");
  img2= loadImage("hell.jpg");
  img3= loadImage("satan.png");
  background(img);
}

void draw() {
 background(img);
 
  tint(255,mouseX/20);
  image(img1,0,0);
  
  tint(255,mouseY/9);
  image(img2,0,0);
  
if(mousePressed) {
  tint(255);
  image(img3,0,0); 

}
}


