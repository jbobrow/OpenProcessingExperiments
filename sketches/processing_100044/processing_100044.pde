
int paintX;
int paintY;  
color myColor;  
    
void drawSelector()
{
  fill(#FF0000);
  rect(0, 0, 800, 20);
  fill(#1400FF);
  rect(0, 20, 800, 20);
  fill(#00FF1F);
  rect(0, 40, 800, 20);
  fill(#FFF300);
  rect(0, 60, 800, 20);
  fill(#FF00C8);
  rect(0, 80, 800, 20);
  fill(#000000);
  rect(0, 100, 800, 20);
}
void setup() {
  size(800, 800);
  background(#FFFFFF);
  frameRate(2400);
  smooth();
  noStroke();
  drawSelector();
}
void draw() {
  stroke(myColor);
  if (mousePressed) {    
    fill(myColor);
    rect(mouseX, mouseY, 2, 2);
  }
  if (keyPressed) {
    myColor = get(mouseX, mouseY);
    println("Key pressed");
  }
}



