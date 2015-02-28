
int x, y;
int vx;
int vy;

void setup() {
  size(600, 600);
  y=5;
  x=0;
  vx=5;
  vy=10;
}
void draw() {
  background(32, 24, 64);
  //translate(x, y);

  charactor(x,y);
  charactor(x-50,y-70);
  charactor(x+40,y-70);


  x=x+vx;
  if (x>width-340) {
    vx=-5;
  }
  if (x<50) {
    vx=5;
  }
  y=y+vy;
  if (y>height-320) {
    vy=-5;
  }
  if (y<50) {
    vy=5;
  }

  if (mousePressed) {
    if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
    }
  }

      //void mousePressed(){
      //noLoop();
      //}

      //void mouseReleased(){
      //loop();
      //}

      //void keyPressed() {
      //if (key == CODED) {
      //if (keyCode == UP) {
      //noLoop();
      //} else if (keyCode == DOWN) {
      //loop();
      //} 
      //}
      }
void charactor(int a, int b) {
  pushMatrix();
  translate(a,b);
    if (mousePressed) {
      background(y);
    }
    translate(x, y);

    fill(232, 28, 106);
    stroke(232, 28, 106);
    if (mousePressed) {
      fill(255, 226, 3);
    }
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
    if (mousePressed) {
      fill(232, 28, 106);
      stroke(232, 28, 106);
    }
    ellipse(5, 0, 5, 5);
    ellipse(35, 0, 5, 5);
    fill(191, 17, 17);
    stroke(191, 17, 17);
    rect(13, 10, 20, 7);
    line(13, 10, 13, 30);

    fill(232, 28, 106);
    stroke(232, 28, 106);
    if (mousePressed) {
      fill(255, 226, 3);
    }
    ellipse(-15, -30, 45, 10);
    ellipse(-25, -15, 45, 10);
    ellipse(-27, 0, 45, 10);
    ellipse(-25, 15, 45, 10);
    ellipse(-15, 30, 45, 10);

    if (mousePressed) {
      stroke(255, 226, 3);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      line(5, 0, 600, 0);
      text("HARAHETTA---!!", 120, -30);
    }
popMatrix();
}


