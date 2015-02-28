
Ball[] ball;

void setup() {
  size(640, 480);
  ball = new Ball[3];
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < ball.length; i++) {
    ball[i].display(int(random(50)), int(random(50)));
  }
}

class Ball { // class name
  int[] x;
  int[] y ;

  // field (DATA)
  Ball (int tempX, int tempY) { 
    x  = new int[70];
    y  = new int[70];
    x[69] = tempX;
    y[69] = tempY;
    for (int i =1; i <x.length; i=i+1) { // i ++ ==== i =i+1;
      x[i] =0;
      y[i] = 0;
    }
  }
  void display() {

    for (int i =0; i < x.length-1; i++) {
      x[i] = x[i +1];// x[49] = x[49+1];
      y[i] = y[i +1];

      x[x.length-1] = mouseX + tempX;
      y[x.length-1] = mouseY + tempY;

      noStroke();
      fill(255-i*3);
      ellipse(x[i], y[i], i, i);
    }
  }
}

