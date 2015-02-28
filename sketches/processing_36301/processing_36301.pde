
float startX;
float startY;
float endX;
float endY;

void setup(){
  size(700,400);
  background(0);
  stroke(255,100);
  strokeWeight(5);
}

void draw(){
  line(pmouseY,pmouseX,mouseY,mouseX);
}

void mousePressed(){
 background(0); 
}


