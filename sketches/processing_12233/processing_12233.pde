
void setup() {
  size (800,800);
  PImage b;
b = loadImage("map.jpg");
background(b);
}
void draw () {
  
  //body
  stroke(0);
  fill(175);
  rectMode(CENTER);
  ellipse(mouseX,mouseY,6.5,12.0);
  ellipse(mouseX-3.0,mouseY-7.0,1.8,2.5);
  ellipse(mouseX-1.6,mouseY-7.0,1.5,1.8);
  ellipse(mouseX,mouseY-7.0,1.5,1.5);
  ellipse(mouseX+1.5,mouseY-6.5,1.5,1.5);
  ellipse(mouseX+2.8,mouseY-5.5,1.3,1.3);
}
void mouseClicked() {
  PFont font;
  font = loadFont("Georgia-12.vlw");
  textFont(font,15);
  text("Select your next adventure-", mouseX,mouseY);
  font = loadFont("Georgia-12.vlw");
  textFont(font,15);
  text("by clicking on the footprints", mouseX,mouseY+23);
}


