
int rheight=200;
int rwidth=600;
int rheight2=100;
int rwidth2=300;
int radius=100;

void setup() {
  size(1600, 800);
  smooth();
  ellipseMode(RADIUS);
}

void draw(){
  background(204);
  int targetX = mouseX;
  rect(targetX -rwidth/2, 400, rwidth, rheight);
  rect(targetX-rwidth2/2, 400-rheight/2, rwidth2, rheight2);
  ellipse(targetX-rwidth/2, 400+rheight, radius, radius);
  ellipse(targetX+rwidth/2, 400+rheight, radius, radius);
  if (mousePressed){
    background(204);
    fill(240, 17, 17);
    rect(targetX -rwidth/2, 400, rwidth, rheight);
    rect(targetX-rwidth2/2, 400-rheight/2, rwidth2, rheight2);
  }else {
    fill (0);
  }
}
