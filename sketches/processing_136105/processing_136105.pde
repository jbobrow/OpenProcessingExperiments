
void setup() {
  size(640, 360);
  background(255);

}

void draw() {
   if (mousePressed){
 
   variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
   }
}

void mouseReleased(){
  fill(random(0,255),random(0,255),random(0,255));
}


void variableEllipse(int x, int y, int px, int py) {

  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}


