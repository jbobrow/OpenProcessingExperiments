
void setup(){
size(600,600);
colorMode(HSB);
noCursor();
smooth();
}
void draw(){
  
}

void mousePressed(){
  fill(210,10,10);
  ellipse(mouseX,mouseY,90,90);
  fill(10,210,10);
  line(mouseX,mouseY,10, 10);
}
