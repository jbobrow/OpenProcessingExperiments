
void setup() {
  smooth();
  size(500, 500);
  fill(0, 0, 0);
  rect(0, 0, width, height);
  noStroke();
}
int counter = 0;
 
void draw() {
 
  stroke(2);
  strokeWeight(2);
 
  //chalk
   fill (20, 40, 60);
  rect (0, 80, 500, 20);
  fill(255);
  rect(60, 20, 40, 40);
  fill(0);
  stroke(255);
  rect(10, 20, 40, 40);

  changeColor();
  strokeWeight(5);
  if (mousePressed && mouseButton==LEFT && mouseX> 40 && mouseY > 90) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void changeColor() {
  if (counter==1) {
    stroke(0);
  }
  else if (counter==2) {
    stroke(150, 150, 150);
  }
}
void changeSelector() {
}
 
void mouseClicked() {
  if (mouseX>10&& mouseX<50 && mouseY<40) {
    counter=1;
  }
  else if (mouseX>60 && mouseX<100 && mouseY<40) {
    counter=2;
  }
    }
