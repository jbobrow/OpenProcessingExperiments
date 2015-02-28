
PImage mascara;  
PImage magnified, normal;


void setup() {
  size(300, 300);
 // mascara=createGraphics(300, 300);
  makeImages();
  background(255);
  noCursor();
}


void makeImages() {  //drawa and store the twwo images that will be used
  noStroke();
  translate(width/2, height/2);
  alvos();
  normal=get(); 
  scale(1.5);
  alvos();
  magnified=get();
}

void alvos() {
  background(255);
  for (int i=5; i>0; i--) {
    fill(200, 0, 0);
    ellipse(0, 0, i*40, i*40);
    fill(255);
    ellipse(0, 0, i*40-20, i*40-20);
  }
}

void draw() {

  //this draws a circicle in an alternate canvas that will be the mask

background(255);
fill(0);
ellipse(mouseX, mouseY, 80, 80);
mascara=get();
  //mascara.endDraw();
  normal.mask(mascara);  //aplies the mask to the image, the image now has a hole on it

  background(255);
  image(magnified, -(mouseX-width/2)/1.9, -(mouseY-height/2)/1.9);   //draws the magnified image underneath the normal image and adjusts its position 
  image(normal, 0, 0);   //draws the normal image

  strokeWeight(5);
  noFill();
  stroke(150, 0, 0);
  ellipse(mouseX, mouseY, 80, 80); // draws the "lens circle"
}

