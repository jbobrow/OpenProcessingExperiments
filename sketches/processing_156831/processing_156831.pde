
float lineX;
float lineY;

int x;
int y;

void setup() {
  size(1000, 1000);
    background(100);
}

void draw() {

  for (int i=0; i<10; i++){
    for (int j=0; j<10; j++){
      setLineCoordinates(mouseX, mouseY);
  drawEllipse(mouseX, mouseY, pmouseX, pmouseY);

  
}
  }
}

void setLineCoordinates(int x, int y){
  lineX = abs(.5*80)+abs(x*80);
  lineY = abs(.5*80)+abs(y*80);

}


void drawEllipse(int x, int y, int i, int j) {
  float speed = abs(x-i) + abs(y-j);
  noStroke();
  fill(speed+(random(255)), speed+(random(255)), speed+(random(255)));
  ellipse(mouseX, mouseY, speed, speed);
  stroke(speed+(random(255)), speed+(random(255)), speed+(random(255)));
  line(mouseX, mouseY, speed, speed);

}
