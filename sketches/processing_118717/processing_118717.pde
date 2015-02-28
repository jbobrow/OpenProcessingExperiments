
int x = 1;
int z = 6;
//enemy health
int e = 100;

void setup() {
  size(480, 800);
}

void draw() {
  background(255);
  //enemy
  fill(255, 0, 0);
  ellipse(x, 100, 100, 100);
  fill(255);
  ellipse(x, 100, 80, 80);
  fill(255, 0, 0);
  ellipse(x, 100, 60, 60);
  fill(255);
  ellipse(x, 100, 40, 40);
  fill(255, 0, 0);
  ellipse(x, 100, 20, 20);
  x = x + z;
  if(x>width) {
    z = -1 *z;
  }
  if(x<0) {
    z = 5;
  }
  //enemy health bar
  rect(x-50, 30, 100, 10);
  fill(0, 255, 0);
  rect(x-50, 30, e, 10);
  //character
  fill(0);
  rect(mouseX-50, 600, 100, 200);
  //winning
  if(e <= 0) {
    fill(255);
    rect(0, 0, width, height);
    textSize(50);
    fill(0);
    text("You Win", 20, height/2-20);
  }
}

void keyPressed() {
  fill(255, 150, 0);
  ellipse(mouseX, 550, 100, 200);
  fill(0);
  rect(mouseX-50, 600, 100, 200);
  if((mouseX>x-50) && (mouseX<x+50)) {
    e=e-1;
  }
}

  


