
int cx1,cy1,cx2,cy2;
void setup() {
  size(600,600);
  frameRate(30);
}
void draw() {
  background(0);
  noFill();
  strokeWeight(3);
  stroke(255);
  cx1 = int(random(200));
  cy1 = int(random(200));
  cx2 = int(random(200));
  cy2 = int(random(200));
  bezier(0,0,mouseX-cx1,mouseY+cy1,mouseX+cx2,mouseY-cy2,600,600);
  bezier(600,0,mouseX+cx1,mouseY-cy1,mouseX-cx2,mouseY+cy2,0,600);
}


