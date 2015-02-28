
void setup() {
 size(700, 700);
 colorMode(HSB);
  background(random(200),255,255);
}
void draw() {
  fill(mouseX/2,58,185,100);
  ellipse(mouseX, mouseY,20, 20);
  ellipse(mouseY, mouseX,30, 30);
   fill(mouseX/2,147,255,230);
  ellipse(height-mouseY, width-mouseX,120, 120);
  ellipse(width-mouseX,height-mouseY,70, 70);
  ellipse(height-mouseY, mouseX,50, 50);
  ellipse(mouseX,height-mouseY,60, 60);
  ellipse(mouseY, width-mouseX,100, 100);
  ellipse(width-mouseX,mouseY,80, 80);
}

