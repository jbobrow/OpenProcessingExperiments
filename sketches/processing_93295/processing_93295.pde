
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
  Myla() {
  myla = createShape();  
  myla.beginShape();
  myla.fill(255,0,0);
  myla.stroke(0, 0, 255);
  myla.strokeWeight(2);
  myla.vertex(100, 100);
 myla.vertex(200, 200);
 myla.vertex(300, 100);
 myla.endShape(CLOSE);
  }
}










