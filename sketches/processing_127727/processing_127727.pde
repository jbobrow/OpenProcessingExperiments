
void setup () {
  size (800,600);
  createGraphics(800, 600);
}
 void draw () {
   fill ((random(255)),(random(255)),(random(255)));
  
stroke((random(255)),(random(255)),(random(255)));
rectMode(CENTER);
rect(400,300, mouseX, mouseY);
}
