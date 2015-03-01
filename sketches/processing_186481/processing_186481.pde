

float px = 0;
 
void setup () {
  size (600, 600);
}
void draw() {
  px +=0.78;
 
 
  if (px>TWO_PI) {
    px=90;
  }
 
  noStroke();
  fill(random(7), random(7), random(7));
  ellipse(mouseX, mouseY, 8, 8);
  fill(random(89));
  arc(mouseX, mouseY, 50, 50, 0, px);
 
  fill(random(1000), random(1000), random(1000));
  ellipse(mouseY, mouseX, 16, 16);
  fill(random(255));
   
  arc(mouseY, mouseX, 50, 50, 100, px);
}

