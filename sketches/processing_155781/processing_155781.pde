
 /* @pjs preload="flowercc.png"; */
 
PImage canvas;
float d = 50;

void setup() {
  size (455,455);
  canvas = loadImage("flowercc.png");
}
 
void draw() {
  image (canvas,0,0);
  
  if (mousePressed == true) {
    fill(10,188,255);
  } else 
    fill(4,33,62);
  
  ellipse(mouseX, mouseY, d, d);
  if (mousePressed) d++;
 
}



