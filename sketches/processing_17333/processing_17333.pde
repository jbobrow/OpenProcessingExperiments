

float f0 = 0;
float f1 = 1;
float f2 = 1;
float nextFib() {
  float result = f2;
  f0 = f1;
  f1 = f2;
  f2 = f0 + f1;
  return result;
}
  
void setup () {
  size (400,900);
  smooth ();
  drawFib ();
}

void draw () {
  if (!mousePressed)
  return;
  drawFib ();
}

void drawFib () {
  background (5);
  f0 = 0;
  f1 = 1;
  f2 = 1;
  float x;
  //stars 
  for (int i = 1; i <700; i++) {
    float xs = random (0,400);
    float ys = random (0,900);
    float ds = random (1,2);
    float trans = random (0,192);
    fill (255, trans);
    noStroke ();
    ellipse (xs, ys, ds, ds);
  }
  //ellipses
  fill (30,60,90,10);
  stroke (255,25);
  strokeWeight (1);  
  for (int i = 0; i < 20; i++) {
    x = (nextFib()/9);
    ellipse (200,i*10,x,x);
    ellipse (200,i*10,x,x);
    ellipse (200,i*10,x*2,x*2);
    ellipse (200,i*10,x*3,x*3);
    ellipse (200,i*10,x*5,x*5);
  }
  //plant
  float beginX, endX, endY;
  noFill ();
  strokeWeight (1);
  for (int i = 0; i < 9; i++) {
    float g = random (100,200);
    float r = g-40;
    float b = g-30;
    stroke (r,g,b,128);
    beginX = random (-100,100);
    endX = random (-50,50);
    endY = random (125,800);
    bezier (200+beginX, 900, 200-beginX, 900, 200+2*endX, endY+((900-endY)/2), 200+endX, endY);
  }
  strokeWeight (4);
  for (int i = 0; i < 1; i++) {
    float g = random (100,200);
    float r = g-40;
    float b = g-30;
    stroke (r,g,b,128);
    beginX = random (-100,100);
    endX = random (-50,50);
    endY = random (450,750);
    bezier (200+beginX, 900, 200-beginX, 900, 200+2*endX, endY+((900-endY)/2), 200+endX, endY);
  }
  strokeWeight (9);
  for (int i = 0; i < 1; i++) {
    float g = random (100,200);
    float r = g-40;
    float b = g-30;
    stroke (r,g,b,128);
    beginX = random (-50,50);
    endX = random (-25,25);
    endY = random (700,800);
    bezier (200+beginX, 900, 200-beginX, 900, 200+2*endX, endY+((900-endY)/2), 200+endX, endY);
  }
}

