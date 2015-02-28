

float x,y,z,r;

void setup () {
  size (500,500);
  ellipseMode (RADIUS);
  colorMode (HSB,360,100,100);
  smooth ();
  frameRate (2);
}

void draw () {
  translate (width/2,height/2);
  float b = 37;
  float x1 = random (-10,10);
  float y1 = random (-10,10);
  background (237,100,b);
  for (int i = 350; i > 1; i-=5) {
    fill (237,100,b);
    noStroke ();
    ellipse (0,0,i,i);
    noFill ();
    b = b+0.5;
  }
  //dots
  fill (210,65,88,128);
  for (int i = 0; i < 21; i++) {
    float x = random (-225,225);
    float y = random (-225,225);
    float r = random (1,2);
    ellipse (x,y,r,r);
    ellipse (-x,-y,r,r);
  }
  for (int i = 0; i < 49; i++) {
    float strokeDensity = random (0,255);
    fill (5,79,100,strokeDensity);
    //float x = random (-100,100);
    //float y = random (-100,100);
    float r = random (1,5);
    ellipse (x1,y1,r,r);
    ellipse (-x1,-y1,r,r);
    x1 = x1 + random (-30,30);
    y1 = y1 + random (-30,30);
  }
  noFill ();
  strokeWeight (1.5);
  //lines
  for (int i = 0; i < 35; i++) {
    float strokeDensity = random (0,255);
    stroke (51,44,100,strokeDensity);
    float x = random (-300,300);
    float y = random (-300,300);
    line (0,0,x,y);
  }
  //circles
  for (int i = 0; i < 7; i++) {
    float strokeDensity = random (0,255);
    stroke (51,44,100,strokeDensity);
    float x = random (-100,100);
    float y = random (-100,100);
    z = sqrt ((sq(x))+(sq(y)));
    ellipse (x,y,z,z);
  }
}

