
int x, y;
int vx, vy;

void setup() {
  size(600, 600);
  background(0);
  x=0;
  y=height/2;
  vx=5;
  vy=7;
}

void draw() {

  chara(x-50, y-70);

  x=x+vx;
  y=y+vy;
  if (x>width-200) {
    vx=-1;
  }

  if (-x>-100) {
    vx=1;
  }

  if (y>height-45) {
    vy=-1;
  }

  if (-y>-45) {
    vy=1;
  }

  if (mousePressed) {
    if ((mouseX > x-50)&&(mouseX < x+50)&&(mouseY > y-50)&&(mouseY < y+50)) {
      x=mouseX;
      y=mouseY;
    }
  }
}

void chara(int a, int b) {
  pushMatrix();
  translate(a, b);

  //background(a, 100, 210);
  //background(0);
  //background(254,255,237);
  strokeWeight(3);



  //stroke(188, 255, 219);
  fill(a, 255, b);
  triangle(10, 60, 50, 10, 65, 75);
  //strokeJoin(ROUND);
  fill(a, 232, b);
  triangle(65, 75, 50, 10, 85, 50);
  //strokeJoin(ROUND);

  if (mousePressed) {
    //stroke(188, 255, 219);
    fill(a, 255, b);
    triangle(10, 60, 50, -500, 65, 75);
    strokeJoin(ROUND);
    fill(a, 232, b);
    triangle(65, 75, 50, -500, 85, 50);
    strokeJoin(ROUND);
  }







  pushMatrix();
  translate(20, 45);
  rotate(map(a, 0, 200, 0, 3.14));
  //udemigi
  fill(219, 255, 0);
  strokeWeight(2);
  line(-100, 50, 0, 0);
  popMatrix();

  pushMatrix();
  fill(219, 255, 0);
  strokeWeight(2);
  translate(70, 50);
  rotate(map(a, 50, 200, 0, 3.14));
  line(0, 0, 50, 100);
  popMatrix() ;

  fill(219, 255, 0);
  strokeWeight(2);
  line(30, 65, 35, 85);

  fill(219, 255, 0);
  strokeWeight(2);
  line(57, 73, 49, 90);

  noStroke();
  fill(0, 0, 0);
  ellipse(52, 40, 3, 3);

  noStroke();
  fill(0, 0, 0);
  ellipse(35, 37, 3, 3);

  fill(255, 72, 72);
  triangle(35, 48, 50, 50, 40, 60);

  popMatrix();
}



