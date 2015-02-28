
int array = 10;
float[] x = new float [array];
float[] y = new float [array];
float[] speed = new float [array];
float[] yspeed = new float [array];
float gravity =  0.1;
float distance;

void setup () {
  size(500, 500);


  for (int i = 0; i < array; i++) {
    x[i] = random(0, 499);
    y[i] = random(0, 500);
    speed[i] = random(1, 5);
    yspeed[i] = random(1, 5);
  
  }
}

void draw () {


  background(255);
  for (int i = 0; i < array; i++) {
    yspeed[i] = yspeed[i] + gravity;
    x[i] = int(x[i] + speed[i]);
    y[i] = int(y[i] + yspeed[i]);
    ellipse (x[i], y[i], 50, 50);
    for (int j = 0; j < array; j++) {

   distance = (dist(x[i], y[i], x[j], y[j]));
       if (distance <= 55) {
        speed[i] *= -1;
        speed[j] *= -1;
      yspeed[i] *= -1;
      yspeed [j] *= -1;
      }
      if (x[i] >= 499) {
        speed[i] *= -1;
        x[i] = 498;
      }
      if (x[i] <= 0) {
        speed[i] *= -1;
        x[i] = 1;
      }
      if (y[i] >= 499) {
        yspeed[i] *= -0.8;
        y[i] = 498;
      }
      if (y[i] <= 0) {
        yspeed[i] *= -0.8;
        y[i] = 1;
      }
//       if (x[j] >= 499) {
//        speed[j] *= -1;
//      }
//      if (x[j] <= 0) {
//        speed[j] *= -1;
//      }
//      if (y[j] >= 499) {
//        yspeed[j] *= -0.9;
//      }
//      if (y[j] <= 0) {
//        yspeed[j] *= -0.9;
//      }
      //      speed[i] = speed[i] + gravity[i];

      if (mousePressed) {
        // check if it's the left mouse button
        if (mouseButton == LEFT) {
          // check if the last key pressed was a c (for circle)
          x[i] = mouseX;
          y[i] = mouseY;
        }
      }
    }
  }
}
