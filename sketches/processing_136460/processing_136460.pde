
Triangle[] tris = new Triangle[230];
float ang;

void setup() {
  background(255);
  size(600, 500, P3D);
  int tx=-50;
  int ty=300;
  int tz=0;
  for (int i=0;i<30;i++) {
    float th=random(2,12)*-25;
    tris[i] = new Triangle(tx, ty, tz, th);
    tx+=150;
    if (tx>width+50) {
      tz-=150;
      tx=-50;
    }
  }
}

void draw() {
  background(255);
  translate(width/2,0,50);
  //camera(mouseX, mouseY, (height/2) / tan(PI/6), height/2, width/2, 0, 0, 2, 0);
  for (int i=0;i<30;i++) {
    pushMatrix();
    rotateY(ang);
    tris[i].display();
    popMatrix();
  }
  ang+=.001;
}


class Triangle {

  float x, y, z;
  float h;

  Triangle(float tx, float ty, float tz, float bh) {
    x=tx;
    y=ty;
    z=tz;
    h=bh;
  }

  void display() {
    pushMatrix();
    lights();
    translate(x, y+150, z);
    translate(0, 0, -50);
    drawPyramid();
    popMatrix();
  }

  void drawPyramid() {
    stroke(0);

    beginShape(TRIANGLES);

    fill(200, 100, 0, 177);
    vertex(50, 0, -50);
    vertex(-50, 0, -50);
    vertex(0, h, 0);

    fill(0, 120, 0, 177);
    vertex( -50, 0, -50);
    vertex( -50, 0, 50);
    vertex( 0, h, 0);

    fill(0, 100, 200, 177);
    vertex( 50, 0, 50);
    vertex(-50, 0, 50);
    vertex( 0, h, 0);

    fill(200, 100, 200, 177);
    vertex(50, 0, -50);
    vertex(50, 0, 50);
    vertex( 0, h, 0);

    endShape();

    beginShape(QUADS);

    fill(0, 177);
    vertex(-50, 0, -50);
    vertex(-50, 0, 50);
    vertex(50, 0, 50);
    vertex(50, 0, -50);
    endShape();
  }
}



