
int movx, movy, incx, incy;

void setup () {
  size (500, 500);
  background(200);
  movx=0;
  movy=0;
  incx=1;
  incy=1;

}

void draw () {



  if (movx==500) {
    incx=incx*-1;
  }

  if (movx<0) {
    incx=incx*-1;
  }

  if (movy>500) {
    incy=incy*-1;
  } 

  if (movy<0) {
    incy=incy*-1;
  }

  
  movx=movx+10*incx;
  movy=movy-9*incy;
  



stroke (255);
  fill (movx, movy, mouseX,100);
  ellipse (movx, movy, 30, 30);
  stroke (255);
  fill (movx, movy, mouseY, 100);
  ellipse (movy, movx, 30, 30);
  
 
  noStroke();
  rect(movy-30, movx+30, 10, 10);
  fill(movx, movy, mouseX,100);
  rect(movx+30, movy-30, 10,10);
  

}
void keyPressed() {
  saveFrame ();
}

