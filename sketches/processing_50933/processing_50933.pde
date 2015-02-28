
//sapace lazerz
PImage space;

void setup() {
  size(800, 800);
  //colorMode(HSB);
  smooth();
  stroke(100,255);
}

void draw() {
  background(70,255,179);
  space = loadImage("space.png");
  image(space, mouseX - 100, mouseY - 100); 
endShape(CLOSE);

if (mousePressed == true) {
  strokeWeight(10);
  stroke(random(255),random(255),random(255));
  line(mouseX -16, mouseY-13, mouseX-200, mouseY+200);
  stroke(random(255),random(255),random(255));
  line(mouseX + 55, mouseY-10, mouseX+200, mouseY+200);
}
  }

