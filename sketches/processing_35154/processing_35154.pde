
void setup (){
  size(400,400);
  smooth();
  background(64,145,255);
  frameRate(30);
}

void draw (){
  stroke (mouseX,0,mouseY);
  dist(pmouseX,pmouseY,mouseX,mouseY);
  triangle (pmouseX,pmouseY,mouseX,mouseY,980,746);
}

void mouseClicked(){
  rectMode(CENTER);
  fill(mouseY,763,mouseX);
  noStroke();
  triangle(mouseX,mouseY,30,30,98,34);
}
void keyPressed(){
  background (248,255,64);
}
