
float theta = 0.0;

void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 255, 255, 255);
}


void draw() {
  background(204);
  theta += 0.01;
  noStroke();
  fill(0);
  float x = theta;
  for (int i = 0; i <= 100; i++) {
    float y = sin(x)*300/2;
    if (i>60) {
    }
    else {
      fill(5*i, 10*i, 35*i);
    }
    //stroke(0,200,180);
    ellipse(i*40, y + 400, y/12, x*3);
    x += 0.2;
  }

  for (int i = 0; i <= 100; i++) {
    float y = sin(x)*300/2;
    if (i>60) {
    }
    else {
      fill(i, 35*i, 55*i);
    }
    ellipse(i*20, y + 400, x*3, y/12);
    x += 0.2;
  }
}

class Myla {
  PShape myla;
  float x, y;
  Myla () {
  myla = createShape(GROUP);  
  PShape head = createShape(ELLIPSE, 0, 0, 50, 50);
  PShape body = createShape(RECT, 0, 50, 50, 100);
  myla.addChild(head);
  myla.addChild(body);
  translate(width/2, height/2);
  shape(myla);
  }
}










