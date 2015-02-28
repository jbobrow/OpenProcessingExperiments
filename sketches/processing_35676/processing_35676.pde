
void setup(){
  size(300,300);
  colorMode(HSB);
  background(45, 180, 255);
  stroke(35);
  line(0, 50, width, 50);
  line(0, 100, width, 100);
  line(0, 150, width, 150);
  line(0, 200, width, 200);
  line(0, 250, width, 250);
}

void draw(){
}

void mouseDragged(){
  smooth();
  noStroke();
  fill(mouseX, 255, 255);
  ellipse(mouseX, mouseY, 20, 20);
}

