
void setup() {
   size(800,800);
   background(0);

}

void draw() {
  if (mousePressed) {
    fill(190,30,3);
  } else {
    fill(255);
  }
  
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);

  
}
     
void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}

