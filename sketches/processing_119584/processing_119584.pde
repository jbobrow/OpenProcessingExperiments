
int myRotation;


void setup() {
  size(550,550);
  myRotation = 0;
  background(255);
}

void draw() {
    fill(255, mouseX, mouseY, 50);
  noStroke();

  if (mousePressed) {
  myRotation+=1;
  float rad = radians (myRotation);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(rad);
  rect(100, 100, 100, 100);
  fill(255, mouseX, mouseY);
  noStroke();
  
 } else {
   rectMode(CENTER);
   rect(100, 100, 100, 100);
   fill(255, mouseX, mouseY);
   noStroke();
 } }



