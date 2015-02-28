
void setup() {
  size(400,400);
  background(255);
}

void draw() {
}

void mousePressed() {
  stroke(0);
  fill( random(255), random(255), random(255), random(255)); 
  rectMode(LEFT);
  triangle(mouseX,mouseY,300,360,250,300);
} 

void keyPressed() {
  background(255);
}
