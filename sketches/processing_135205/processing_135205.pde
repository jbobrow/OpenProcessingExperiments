
void setup () {
  size(600, 600, P3D);
  background(255,0,0);
smooth();
noCursor();
}

void draw () {
  translate(mouseX, mouseY,100);
  rotateY(0.5);
  fill(random(255));
  box(random(50));

}

void mousePressed () {

background (random(255),random(255),random(255));

}
