
PImage mouth;
PImage hat;
PImage k;

void setup () {
  size (700,700);
  mouth = loadImage ("mouth.jpg");
  hat = loadImage ("Hat.png");
  k = loadImage ("K.jpg");
}

void draw () {
  background (k);
  smooth ();
  noStroke();
  fill (255);
  rectMode(CENTER);
  ellipse (mouseX, mouseY,200,260);
  fill (0);
 // create black eyes
  ellipse (mouseX -40,mouseY -40,40,40);
ellipse (mouseX +40, mouseY -40,40,40);
//create nose
ellipse (mouseX, mouseY -10,15,15);
//create eyeballs
fill (255);
ellipse (mouseX -45, mouseY -45,15,15);
ellipse (mouseX +45,mouseY -45,15,15);
//create leg
ellipse (mouseX -60, mouseY +110,60,60);
ellipse (mouseX +60, mouseY +110,60,60);
//create hands
ellipse (mouseX -80,mouseY+10,100,50);
ellipse (mouseX +80,mouseY +10,100,50);
//create mouth
image(mouth,mouseX-33, mouseY+5,60,80);
//create a hat
image (hat,mouseX -90,mouseY -250, 175,175);
  

}

