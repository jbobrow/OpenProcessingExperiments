
int movx, movy, incx, incy;
float R = random(30, 255);
float G = random(20, 205);
float B = random(20, 200);

void setup () {
  size (600, 600);
  background(240);
  movx=0;
  movy=0;
  incx=1;
  incy=1;
}
void draw () {

  if (movx==590) {
    incx=incx*-1;
  }

  if (movx<0) {
    incx=incx*-1;
  }

  if (movy>590) {
    incy=incy*-1;
  }

  if (movy<0) {
    incy=incy*-1;
  }

  movx=movx+10*incx;
  movy=movy-19*incy;

  stroke (255,G,B);
  fill (R, G, B, 90);
  ellipse (movx, movy, 30, 30);
  stroke (R,G,100);
  fill (R-10, G, B, 90);
  ellipse (movy, movx, 30, 30);


  noStroke();
  fill(movx, movy, mouseX, 100);
  rect(movy-10, movx+10, 10, 10);
  rect(movx+10, movy-10, 10, 10);
}
void mousePressed()
{
  R = random(20, 255);
  G = random(20, 255);
  B = random(20, 200);
};

void keyPressed() {
  saveFrame ();
}
