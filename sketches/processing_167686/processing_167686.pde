
/* @pjs preload= "peach.jpg"; */
PImage peaches;

void setup() {
  size(500,500);
  noStroke();
  peaches = loadImage("peach.jpg");
}

void draw() {
  image(peaches, 0,0, 500, 500);
  PImage crop = get();
  image(crop, 50, 50);
  color c = get(mouseX, mouseY);
  fill (c);
  rect(50, 0, 50, 100);
  rect(100, 100, 50, 100);
  rect(200, 300, 50, 100);
  rect(400, 100, 50, 500);

}




