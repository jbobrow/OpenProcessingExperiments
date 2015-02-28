
int dia = 40;
float theta;
int amp = 55;

int mini_dia = dia/4;

public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);

  smooth();
}

void draw() {
  background(0);
  noStroke();

  for (int i = 0;i < 8;i++) {
    fill(255, 0, 0);
    noStroke();
    ellipse(dia+dia*3/2*i, height/2+amp*sin(theta+i), dia, dia);


    if (sin(theta+i) > 0.9 || sin(theta+i) < -0.9) {
      face_top(dia+dia*3/2*i, height/2+amp*sin(theta+i));
    }
    else {
      face(dia+dia*3/2*i, height/2+amp*sin(theta+i));
    }
  }

  theta += 0.1;
}

void face(float x, float y) {
  fill(0);
  noStroke();
  ellipse(x-8, y-10, mini_dia, mini_dia);
  ellipse(x+8, y-10, mini_dia, mini_dia);

  noFill();
  stroke(0);
  strokeWeight(4);
  arc(x, y+5, 2*mini_dia, mini_dia, 0, PI);
}

void face_top(float x, float y) {
  noFill();
  stroke(0);
  strokeWeight(4);
  line(x-3, y-5, x-10, y-12);
  line(x-3, y-5, x-10, y);

  line(x+3, y-5, x+10, y-12);
  line(x+3, y-5, x+10, y);


  arc(x, y+5, 2*mini_dia, mini_dia, 0, PI);
}

