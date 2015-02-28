

float x = 0;
float y = 0;
float d = random (6);
float c = random (96,255);
float i;

void setup () {
  size (300,485);
  ellipseMode (CENTER);
  smooth ();
  for (i = 0; i < 486; i++) {
    stroke (192-i/5);
    line (0,i,300,i);
  }
  noStroke ();
  frameRate (3600);
}

void draw () {
  fill (c);
  ellipse (x,y,d,d);  
  x = x + (random (-0.5,0.5));
  y = y + 2;
  d = d-0.02;
  if (d <= 0) {
    y = 0;
    d = random (mouseY/80);
    c = random (96,255);
    x = mouseX;
  }
}

