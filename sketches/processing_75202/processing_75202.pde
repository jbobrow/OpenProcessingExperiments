
PImage img;



void setup() {
  size(768, 800);

  img= loadImage("The beatles.jpg");
 
}


void draw() {

  tint(mouseX,mouseY, mouseX-mouseY);
  //imageVariable, x,y);
  image(img, 0, 0);
  image(img, width/2, 0);
  image(img, 0, height/2);
  image(img, width/2, height/2);
}



