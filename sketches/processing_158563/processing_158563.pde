
 float px = 0;
 
void setup () {
  size (600, 600);
}
void draw() {
  px +=10;
 
 
  if (px>TWO_PI) {
    px=0;
  }
 
  noStroke();
  fill(random(50), random(50), random(50));
  ellipse(mouseX, mouseY, 50, 50);
  fill(random(50));
  arc(mouseX, mouseY, 410, 410, 10, px);
 
  fill(random(250), random(50), random(250));
  ellipse(mouseY, mouseX, 50, 50);
  fill(random(255));
   
  arc(mouseY, mouseX, 150, 150, 10, px);
}

