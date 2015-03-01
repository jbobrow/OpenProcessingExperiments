
void setup(){
  size (800,800);
  strokeWeight(10);
}
void draw (){
  line (pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed (){
  stroke (247,10,69);
}
void keyPressed(){
  stroke (0);
}
