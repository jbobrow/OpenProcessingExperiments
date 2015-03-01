
int x; int y; int trans;

void setup(){
  size(600, 600);
  frameRate(30);
  background(255);
}

void draw(){
  if (mousePressed) {
      rotate(random(0, PI/2));
      noStroke();
      triangle(mouseX,mouseY,x,y,mouseX+10,mouseY+50);
      fill(255,237,147,50);
  }
}
