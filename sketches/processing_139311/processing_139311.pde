
int lineLength = 100;
int[] x = new int[lineLength];
int[] y = new int[lineLength];

int counter = 0;

color[] c = new color[lineLength];

int[] s = new int[lineLength];

color currentColor;
int currentSize;

void setup() {
  size (600, 600);
  background(255);
  smooth();
}

void draw () {

  stroke (50, 50, 150);
  fill (150, 150, 255);

  if (keyPressed) {
    background ( random(0, 255), random(0, 255), random(0, 255) );

//press r key to draw a red ellipse
    if (key == 'r') {
      currentColor = color(255, 0, 0);
    }

//press g key to draw a green ellipse
    if (key == 'g') {
      currentColor = color(0, 255, 0);
    }

//press b key to draw a blue ellipse
    if (key == 'b') {
      currentColor = color(0, 0, 255);
    }

//press 1 key to a draw small sized ellipse
    if (key == '1') {
      currentSize = 10;
    }

//press 2 key to a draw medium sized ellipse
    if (key == '2') {
      currentSize = 20;
    }
    
//press 3 key to a draw large sized ellipse
    if (key == '3') {
      currentSize = 30;
    }
  }

  int i = 0;
  while (i < x.length) {
    noStroke();
    fill(c[i]);
    ellipse(x[i], y[i], s[i], s[i]);
    i = i + 1;
  }

  if (mousePressed) {
    if (counter >= x.length) {
      x = expand(x);
      y = expand(y);
      c = expand(c);
      s = expand(s);
    }
    x[counter] = mouseX;
    y[counter] = mouseY;
    c[counter] = currentColor;
    s[counter] = currentSize;

    counter = counter + 1;
  }
}



