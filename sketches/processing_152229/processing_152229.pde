
float[] x, y;
float[] dx, dy;
float rad;
int num = 44;
float min = 2;
float max = 2;

void setup() {
  size(600, 600);

  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];

  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
    dx[i] = random(-2, 2);
    dy[i] = random(-2, 2);
  }
  background(255);
}

void draw() {

//  background(255);


  for (int i = 0; i < num; i++) {
    x[i] += dx[i];
    y[i] += dy[i];


    noFill();
    stroke(255, 0, 0);
   // ellipse(x[i], y[i], 30, 30);
    if (x[i] > width || x[i] < 0) {
      dx[i] = dx[i] > 0 ? -random(1) : random(1);
    }


    if (y[i] > height || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(1) : random(1);
    }
  }

  for (int i=0; i < num; i++) {
    for (int j = 0; j < i; j++) {
      float dist1 = dist(x[i], y[i], x[j], y[j]);
      if (dist1 < 100) {
        if (i%2 == 0 || j%2 == 0) {
          fill(0, 100, 150);
        //  text("E", x[i], y[i]);
          stroke(0, 10);
         
          
        } else {
          fill(255, 100, 150);
        //  text("O", x[i], y[i]);
          stroke(255, 0, 0, 10);
        }
        noFill();
        line( x[i], y[i], x[j], y[j] );
      }
    }
  }
}

