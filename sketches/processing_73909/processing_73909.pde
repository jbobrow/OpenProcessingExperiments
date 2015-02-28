

void setup() {
  size(600, 600);
  fill(255, 50, 50, 30);
  //noLoop();
  //  rectMode(CENTER);
  frameRate(17);
}

void draw() {
  background(255);
  translate(100, 0);
  
  for (int ii=0;ii<20;ii++) {
    translate(0,20);
    pushMatrix();
    for (int i=0;i<10;i++) {

      rect(0, -10, 50, 20);

      ellipse(0, 0, 3, 3);
      translate(50, 0);
      rotate(radians(map(mouseX, 0, width-5, 100, 0)));
    }
    popMatrix();
  }
}

void grid(int space) {

  for (int x=0;x<width/2;x+=space) {
    for (int y=0;y<width/2;y+=space) {
      rect(x, y, space, space);
    }
  }
}


