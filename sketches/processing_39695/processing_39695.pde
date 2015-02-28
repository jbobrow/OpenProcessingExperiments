

void setup() {
  size(800, 533);
  smooth();
  newBackground();
}

void newBackground(){
  PImage b;
  b = loadImage("background.png");
  image(b, 0, 0);
}

void draw() {
// prevent from drawing over the sidebar
if (mouseX > 175) {
  noFill();
  noStroke();
  stroke(255,200);
  fill(mouseX,mouseY,random(0-255),5);
  translate(165,0);
    bezier(0,(height/2),mouseX,mouseY,mouseX,mouseY,width-175,(height/2));
}
}

void mousePressed() {
  
  if (mouseX > 175) {
  translate(-165,0);
    newBackground();
  }  
}

