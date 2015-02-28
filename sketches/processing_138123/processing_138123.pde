
int speed=50;
void setup(){
  background (255,255,255);
  size(600,600);
  smooth();
}
void draw() {
  float b=random(7);
  rotate(PI/7);
  if (mousePressed==true) {
    mousePressed();
  }
  else {
    mouseReleased();
  }
}
void mouseReleased() {
  float a=random(6);
  float g=random(50,255);
  float locationX=mouseX-300;
  float locationY=mouseY-300;
  background (255);
  frameRate(30);
  translate(300,300);
  rotate(PI/a);
  stroke(255,g,locationX-600,100);
  fill(255,g,locationX+1,50);
  triangle(locationX,locationY,locationX-10,locationY-10,locationX,locationY+100);
}

void mousePressed() {
  frameRate(speed);
  float a=random(6);
  float g=random(50,255);
  float locationX=mouseX-300;
  float locationY=mouseY-300;
  translate(300,300);
  rotate(PI/a);
  stroke(255,g,locationX+1,100);
  fill(255,g,locationX+1,50);
  triangle(locationX,locationY,locationX-10,locationY-10,locationX,locationY+100);
  speed+=1;
}
