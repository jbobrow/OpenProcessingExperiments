
PShape sp1;
PShape sp2;
float counter;

void setup() {
  counter=0;
  size (350, 350);
  smooth();
  sp1=loadShape("spiral1.svg");
  sp2=loadShape("spiral2.svg");
}
void draw() {
  background(255);
  counter++;
  spiral2(1+mouseY/50);
  spiral1(1+mouseX/50);
}
void spiral1(float n) {
  translate(width/2, height/2);
  rotate(n*counter*TWO_PI/360);
  translate(-sp1.width/2, -sp1.height/2);
  shape(sp1, 0, 0);
}
void spiral2(float n) {
  pushMatrix();
  translate(width/2, height/2);
  rotate(-n*counter*TWO_PI/360);
  translate(-sp2.width/2, -sp2.height/2);
  shape(sp2, 0, 0);
  popMatrix();
}




