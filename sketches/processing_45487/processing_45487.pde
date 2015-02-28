
//ahora algo con sols líneas, rebotando por doquier, ah y con color
int q = 10;
float[] px, py, incx, incy, ruix, ruiy;
float vel=10;
float sep=0.1;

void setup () {
  size(800, 400 );
  background(240);
  smooth();

  px = new float[q];
  py = new float[q];
  incx = new float[q];
  incy = new float[q];
  ruix = new float[q];
  ruiy = new float[q];

  for (int i=0; i < q; i++) {

    px[i]=random(100, width-100);
    py[i]=random(100, height-100);
    incx[i]=random(-sep, sep)*vel;
    incy[i]=random(-sep, sep)*vel;
  }
}

void draw() {
  strokeWeight(0.25);
  for (int i=0; i < q; i++) {
    noStroke();
    fill(20);
    ellipse(px[i], py[i], 3, 3);
    px[i]+=incx[i]*ruix[i];
    py[i]+=incy[i]*ruiy[i];
    ruix[i]=noise(px[i])*3;
    ruiy[i]=noise(py[i])*3;
  }
  stroke(50, 0, 50, 50);
  for (int i=0; i < q-1; i++) {
    line(px[i], py[i], px[i+1], py[i+1]);
  }
  stroke(50, 50, 50, 20);
  line(px[0], py[0], px[q-1], py[q-1]);

  for (int l=0; l<q; l++) {
    if ((px[l]>=width-2) || (px[l]<= 2)) {
      incx[l]= -incx[l];
    }
    if ((py[l]>height-2) || (py[l]<= 2)) {
      incy[l]= -incy[l];
    }
  }
}


