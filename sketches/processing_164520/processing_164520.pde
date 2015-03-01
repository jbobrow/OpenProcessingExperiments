
PImage myImage;
PFont f;

void setup(){
  size (700,650);
  f = loadFont ("BellMTBold-48.vlw");
  myImage = loadImage ("mocapselfie.jpg");
  fill(255,0,0);
  }

void draw(){
  textAlign(CENTER);
  textFont (f);
  fill (255,0,0);
  text ("Draw your own conclusions", width/2,200);
}

void mouseDragged() {
  noStroke();
  fill(255);
  ellipse(mouseX,mouseY,10,10);
}



