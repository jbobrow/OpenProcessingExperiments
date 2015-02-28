

void setup (){
  size(250,250);
  background(0); 
}
void draw () {
fill(255);
strokeWeight(5);
stroke(0); }
void mouseDragged (){
if (mouseButton == LEFT) {
ellipse(mouseX, mouseY, 25, 20);
} else if (mouseButton == RIGHT);
rect (mouseX, mouseY, 10,10);
}

