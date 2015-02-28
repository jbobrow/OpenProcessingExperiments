
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
  stroke(0, random(200, 250));
  line(    x1,     y1,     x2,     y2);
  line(x1 + 2, y1 + 2, x2 + 2, y2 + 2);
  line(x1 + 3, y1 + 3, x2 + 3, y2 + 3);
  stroke(0, random(100, 200));
  line(x1 + 4, y1 + 4, x2 + 4, y2 + 4);
  line(x1 + 6, y1 + 6, x2 + 6, y2 + 6);
}

void keyPressed(){
  save("blurredLine.png");
}

