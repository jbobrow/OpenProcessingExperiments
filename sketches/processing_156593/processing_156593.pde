
float posX;
float posY;
int triangleColor = 0;

void setup() {
  size(800, 600);
  rectMode(CENTER);
}

void draw() {

  background(255);
  noStroke();
  fill(255, 100, 110);
  rect(width/2, height/2, 100, 50);

  posX += (mouseX - posX)* 0.05;
  posY += (mouseY - posX)* 0.05;

  stroke(2);
  fill(triangleColor);
  
  if (mouseX >  width/2 -50 &&
    mouseX < width/2 + 50 &&
    mouseY > height/2 -25 &&
    mouseY < height/2 + 25) {
    pushMatrix();
    translate(width/2, height/2);
    triangle(posX, posY, posX + 200, posY - 5, 3, 3);
    popMatrix();
  }
  println(mouseX);
}

