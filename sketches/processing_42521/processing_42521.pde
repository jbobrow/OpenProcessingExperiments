
void setup() {
  size(500, 500);
  background (23,152,226);
  smooth();
}


int x1 = 500;
int y1 = 500;

int speedX=1;
int speedY=2;

int speedX1 =10;
int speedY1 = 10;



int xg = 500;
int yg = 500;

int speedXg =5;
int speedYg = 2;


int xf = 500;
int yf = 500;

int speedXf =6;
int speedYf = 3;


int xm = 500;
int ym = 500;

int speedXm =4;
int speedYm = 5;




void draw() {

  fill( 181, 226, 23, 100);
  rect(0, 0, width, height);

  if (x1>=width || x1<0) {
    speedX1 = speedX1 * -1;
  } 
  if ( y1>=height || y1<0) {
    speedY1=speedY1 *-1;
  }

  ellipse (x1, y1, 30, 30);
  x1=x1+speedX1;
  y1=y1+speedY1;





  if (xg>=width || xg<0) {
    speedXg = speedXg * -1;
  }
  if ( yg>=height || yg<0) {
    speedYg=speedYg *-1;
  }

  fill(188, 215, 231);
  ellipse (xg, yg, mouseX+5, mouseY+5);
  xg=xg+speedXg;
  yg=yg+speedYg;






  if (speedXf< speedXf -1) {
    speedXf = speedXf  -1;
  }


  if (xf>=width || xf<0) {
    speedXf = speedXf * -1;
  }
  if ( yf>=height || yf<0) {
    speedYf=speedYf *-1;
  }

  if (mousePressed && mouseButton==LEFT) {
    speedXf = speedXf+1;
  }

  fill(20, 250, 20);
  ellipse (xf, yf, 30, 30);
  xf=xf+speedXf;
  yf=yf+speedYf;









  if (speedXm< speedXm -1) {
    speedXm = speedXf  -1;
  }


  if (xm>=width || xm<0) {
    speedXm = speedXm * -1;
  }
  if ( ym>=height || ym<0) {
    speedYm=speedYm *-1;
  }

  if (mousePressed && mouseButton==RIGHT) {
    speedXm = speedXm-1;
  }

  fill(20, 20, 20);
  ellipse (xm, ym, 30, 30);
  xm=xm+speedXm;
  ym=ym+speedYm;
}


