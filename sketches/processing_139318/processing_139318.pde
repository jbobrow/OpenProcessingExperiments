
int lineLength = 100;
int [] x = new int [lineLength];
int [] y = new int [lineLength];

int counter = 0;

color [] c = new color [lineLength];
int [] s = new int [lineLength];

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  stroke(50, 50, 150);
  fill(150, 150, 255);

  if (keyPressed ) {
    background( random (0, 255), random (0, 255), random (0, 255) );
  }

  int i = 0;
  while (i < x.length) {
      fill(c[i]);
      ellipse(x[i], y[i], s[i]+5, s[i]+5);
      println(s[i]);
      i = i + 1;
    }

    if ( mousePressed ) {
      if ( counter>= x.length) {
        x = expand(x);
        y = expand(y);
        c = expand(c);
        s = expand(s);
      }
      x[counter] = mouseX;
      y[counter] = mouseY;

      if (key == 'r') {
        c [counter] = color (255, 0, 0);
      }

      if (key == 's') {
        s [counter] = int (random(1, 20));
      }
      counter = counter +1;
    }
  }



