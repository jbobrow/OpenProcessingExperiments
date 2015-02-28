
//Dandelion
//if mousePressed, the dandelion and grass will growth slowly
//chiming lu

int div =4;

void setup() {
  size(500, 200);
  background(255);
  frameRate(1);
  
}

void draw() {
  if (mousePressed) {
    for (int i=10;i<480;i+=10) {
      wiggleline(i, 10, i, 450);
      wiggleline(i, 10, i, 50);
      Dandelion(0, 0, 0, 0);
      Dandelion(20, 30, 40, 0);
      Dandelion(-40, -20, -30, 0);
    }
  }
  else {
  }
}

void  wiggleline(float sx, float sy, float ex, float ey) {

  strokeWeight(random(2));
  stroke(162, 205, 90);
  // line(sx, sy, ex, ey);
  // float xstep = (ex - sx)/div;
  // float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  for (int i=0; i<div; i++) {
    x = x + random(20) - 10; 
    y = y + random(50) - 25; 
    line (x, height+y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}


float a=PI/30;

void Dandelion(float sx1, float sy1, float ex1, float ey1) {
  stroke(181, 181, 181); 
  line(260-sx1, 100-sy1, 300-ex1, 200-ey1);

  pushMatrix();
  translate(260-sx1, 100-sy1);
  rotate(a);
  a+=PI/30;
  line(1, 1, 10, 10);
  //line(random(2),random(2),random(10),random(10));
  popMatrix();
}



