
int rect_size = 10;

void setup() {
  size(700, 200);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  noLoop();
  noStroke();
  rectMode(CENTER);
}

void draw() {
  for (int k = 0 ; k < 7; k++) {

    for (int i = 0 ; i < 10; i++) {
      for (int j = 0; j <  20; j++) {
        if (i % 2 == 0) {
          if (j % 2 == 0) {
            fill(k * 360 / 7, 50, 100);
          } else {
            fill(k * 360 / 7, 80, 100);
          }
        } else {
          if (j % 2 == 0) {
            fill(360);
          } else {
            fill(k * 360 / 7, 50, 100);
          }
        }
        rect(i*rect_size+rect_size/2+100*k, j*rect_size+rect_size/2, rect_size, rect_size);
      }
    }
  }
}



