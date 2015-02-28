
void setup() {
  size(600, 600);
  noSmooth();
  fill(0);
  strokeWeight(2);
  PImage img;
  img = loadImage("turtle background.jpg");
  background(img);
}
void draw() {
  PImage img;
  img = loadImage("turtle background.jpg");
  background(img);
  if (mousePressed) {
    stroke(96,154,211);
    noFill();
  } else {
    stroke(15,94,170);
    fill(106,149,240);
  }
  for(int i=0; i<100; i++){
  }
  ellipse(mouseX-20, mouseY, mouseX+20, mouseY);
  ellipse(mouseX, mouseY-20, mouseX, mouseY+20);
  //line(mouseX-66, mouseY, mouseX+66, mouseY);
  //line(mouseX, mouseY-66, mouseX, mouseY+66); 
}


