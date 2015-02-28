
float x;
float y;
float incx;
float incy;
float x2;
float y2;
float incx2;
float incy2;


void setup() {
  size(500, 500);
  background (#2D0D58) ;
  x = 50;
  y = 50;
  incx = 0;
  incy = 1;
  x2 = height-100;
  y2 = width-100;
  incx2 = 0;
  incy2 = 1;
}

void draw() {
  background(#2D0D58);

  noStroke();
  fill(#11BF78);
  rect (x, y, 50, 50);

  noStroke();
  fill(#DE6D41);
  rect (x2, y2, 50, 50);


  if (x==50) {
    incy=1;
    y= y+ incy;
  }
  if (y==(height-100)) {
    incx=1;
    x=x+ incx;
  }
  if (x==(width-100)) {
    incy=-1;
    y=y+ incy;
  }
  if (y == 50) {
    incx=-1;
    x= x+ incx;
  }

  // x2 y y2  


  if (y2==(height-100)) {
    incx2=-1;
    x2=x2+ incx2;
  }
  if (x2==50) {
    incy2=-1;
    y2= y2+ incy2;
  }
 
  if (y2 == 50) {
    incx2 = 1;
    x2 = x2+ incx2;
  }
   if (x2==(width-100)) {
    incy2=1;
    y2=y2+ incy2;
  }
}
