
int count = 3;
int [] r = new int[count];
color [] c = new color [3]; 

float[] xpos = new float[count];
float[] ypos = new float[count];
float[] xSpeed = new float [count];
float [] ySpeed = new float [count];
float [] distance = new float [count];

float gravity = 0.1;

void setup() {
  size(500, 500);

  xpos[0] = 15;
  xpos[1] = 140;
  xpos[2] = 180;

  ypos[0] = 100;
  ypos[1] = 15;
  ypos[2] = 100;

  xSpeed[0] = 5;
  xSpeed[1] = 3;
  xSpeed[2] = 5;

  ySpeed[0] = 3;
  ySpeed[1] = 4;
  ySpeed[2] = 3;

  c[0] = color(0, 140, 100);
  c[1] = color(140, 80, 100);
  c[2] = color(50, 100, 50);
}

void draw() {
  background(255);

  noStroke();
  smooth();

  for ( int i = 0; i < count; i++) {
    for ( int j = 0; j < count; j++) {

      if (i != j) {
        r[i] = 10;
        xpos[i] = xpos[i] += xSpeed[i];
        ypos[i] = ypos[i] += ySpeed[i];
        ySpeed[i] = ySpeed[i] + gravity;

        if (xpos[i] >= 490 || xpos[i] <= 10) {
          xSpeed[i] = xSpeed[i] * -1;
        }

        if (ypos[i] >= 490 || ypos[i] <= 10) {
          ySpeed[i] = ySpeed[i] * -0.95;
        }

        distance[i] = dist(xpos[i], ypos[i], xpos[j], ypos[j]);

        if (distance[i] <= (r[i]+r[j])) {
          ySpeed[i] *= -0.95;
          ySpeed[j] *= -0.95;
        } 

        if (distance[i] <= (r[i]+r[j])) {
          xSpeed[i] *= -0.95;
          xSpeed[j] *= -0.95;
        }
      }
    }
  }

  for ( int i = 0; i < count; i++) {
    fill(c[i]);
    ellipse(xpos[i], ypos[i], 20, 20);
  }
}


