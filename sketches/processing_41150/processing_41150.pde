
/*
  Create a sky with twinkling stars. An example of using arrays.
  Author: Charlie McDowell
 */
 
int[] starX = new int[1000];
int[] starY = new int[1000];
color[] starColor = new color[1000];

void setup() {
  size(800,600);
  for (int i = 0; i < 1000; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(100,255));
  }
}

void draw() {
  background(0,0,50);
  for (int i = 0; i < 1000; i++) {
    //fill(random(100,255));
    if (random(10) < 1) {
      starColor[i] = (int)random(100,255);
    }
    fill(starColor[i]);
    ellipse(starX[i], starY[i], 3, 3);
  }
}



