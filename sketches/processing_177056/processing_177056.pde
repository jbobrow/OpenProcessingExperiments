
float num;

void setup() {

  size(640, 640);

  noStroke();

}

 

void draw() {

  background(0);

  fill(255, 255, 255, 50);

  translate(width/2, height);

  for (int q = 60; q > 0; q--) {

    beginShape(TRIANGLE_STRIP);

    for (int i = 0; i < 180; i+=12) {

      float d = map(q, 60, 0, 12, 0.1);

      vertex(sin(q+i+num)*50, -i*d);

    }

    endShape();

  }

  fill( 0, 150, 255, 50);

  for (int q = 60; q > 0; q--) {

    beginShape(TRIANGLE_STRIP);

    for (int i = 0; i < 180; i+=12) {

      float d = map(q, 60, 0, 12, 0.1);

      vertex(-150+sin(q+i+num)*50, -i*d);

    }

    endShape();

  }

  fill(255, 0, 0, 50);

  for (int q = 60; q > 0; q--) {

    beginShape(TRIANGLE_STRIP);

    for (int i = 0; i < 180; i+=12) {

      float d = map(q, 60, 0, 12, 0.1);

      vertex(150+sin(q+i+num)*50, -i*d);

    }

    endShape();

  }

  num+=0.01;

}

