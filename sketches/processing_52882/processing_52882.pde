

float[] x, y;

int nombreEllipses = 10;


void setup () {
  size(400, 400);
  smooth(); 


  x = new float[nombreEllipses];
  y = new float[nombreEllipses];

  for ( int i = 0 ; i < nombreEllipses ; i = i + 1 ) {
    x[i] = random(15, width-15);
    y[i] = random(15, height-15);
  }
}


void draw() {
  background(0);

  for ( int i = 0 ; i < nombreEllipses ; i = i + 1 ) {

    float distance = dist(mouseX, mouseY, x[i], y[i]);

    if ( distance < 30 ) {
      float radians = atan2(mouseY-y[i], mouseX-x[i]);
      radians = radians + PI;
      x[i] = constrain( cos(radians) * 10 + x[i], 15, width - 15);
      y[i] = constrain( sin(radians) * 10 + y[i], 15, height - 15);
    }


    ellipse(x[i], y[i], 30, 30);
  }
}

