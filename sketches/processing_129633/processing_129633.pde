



void setup() {size(640, 360);background(255,252,230);} void draw() {

  variableLine(mouseY, mouseY, pmouseX, pmouseY);
}


void variableLine(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(0);
  
  strokeWeight(.01);
strokeJoin(2);
strokeCap(500);
beginShape(200);
line (x,y, 300, speed);
 
  line(mouseX, 0, mouseX, 500);
}

