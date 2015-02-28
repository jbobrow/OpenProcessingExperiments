
void setup(){
  size(500, 500);
  smooth();
}

void draw(){
  if(mousePressed == true){
    blurredLine(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void blurredLine(float x1, float y1, float x2, float y2){
  strokeWeight(3);
  line(x1 + random(3), y1 + random(5), x2 + random(5), y2 + random(3));
}

void keyPressed(){
  save("blurredLine.png");
}

