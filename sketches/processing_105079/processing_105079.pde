
int x, y;
int vx;
int vy;

void setup() {
  size(600, 600);
  y=0;
  x=0;
  vx=10;
  vy=10;
}
void draw() {
  background(32, 24, 64);
  charactor(x, y);
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode == DOWN) {
      y=y+vy;
      vy=10;
    } 
    else if (keyCode==UP) {
      y=y+vy;
      vy=-10;
    } 
    else if (keyCode==RIGHT) {
      x=x+vx;
      vx=10;
    } 
    else if (keyCode==LEFT) {
      x=x+vx;
      vx=-10;
    }
  }
}

void charactor(int a, int b) {
  pushMatrix();
  translate(a, b);
  //if (mousePressed) {
  //background(y);
  //}

  fill(232, 28, 106);
  stroke(232, 28, 106);
  //if (mousePressed) {
  //fill(255, 226, 3);
  //}
  ellipse(13, -30, 45, 10);
  ellipse(23, -15, 45, 10);
  ellipse(26, 0, 45, 10);
  ellipse(23, 15, 45, 10);
  ellipse(13, 30, 45, 10);
  fill(255);
  stroke(13, 255, 164);
  ellipse(0, 0, 90, 80);

  stroke(0, 0, 0);
  fill(0);
  //if (mousePressed) {
  //fill(232, 28, 106);
  //stroke(232, 28, 106);
  //}
  ellipse(5, 0, 5, 5);
  ellipse(35, 0, 5, 5);
  fill(191, 17, 17);
  stroke(191, 17, 17);
  rect(13, 10, 20, 7);
  line(13, 10, 13, 30);

  fill(232, 28, 106);
  stroke(232, 28, 106);
  //if (mousePressed) {
  //fill(255, 226, 3);
  //}
  ellipse(-15, -30, 45, 10);
  ellipse(-25, -15, 45, 10);
  ellipse(-27, 0, 45, 10);
  ellipse(-25, 15, 45, 10);
  ellipse(-15, 30, 45, 10);

  
popMatrix();
}


