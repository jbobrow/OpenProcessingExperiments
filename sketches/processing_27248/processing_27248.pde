
void setup() {
  size(400,400);
  background (115,144,1);
  strokeWeight (3);
  stroke (255);
}

void draw(){
  fill (random(0, 255));
  ellipse(mouseX, mouseY, 10, 10);
 
if (mousePressed == true) {
  fill (random(0,255),
  random(0,255), 0);
  stroke (0);
}

if (mousePressed ==false) {
  fill(random(0, 255));
  stroke (255);
  ellipse(mouseX, mouseY, 10, 10);
}

}
void keyPressed () {
  fill (random(0,255), random(0,255), random(0,255));
  ellipse (mouseX, mouseY, 20, 20);
  
}
