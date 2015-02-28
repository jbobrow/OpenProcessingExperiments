
int rainbow = 0;

void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB, 600);
  smooth();
}

void draw() {
noStroke();
  fill(mouseX, mouseX, mouseY);
  ellipse(mouseX, mouseY, 20, 20);   
  frameRate(60);
  
}

void mousePressed() {

}
