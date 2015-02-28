
void setup () {
  size(600, 600, P3D);
  background(255,0,0);
}
void draw () {
  translate(mouseX, mouseY, 100); 
  rotateY(0.5);
  fill(random(255), random(255), random(255), random(255));
  box(50);
}


