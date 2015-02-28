
int aClick = 1;

void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB, 600, 100, 600); 
  smooth();
}

void draw(){
  println(mouseX + " " + mouseY);
  fill(mouseX, 255, mouseY); 
  rect(random(600), random(600), 30, 90);
}
  void mousePressed() {
  background(255);}



