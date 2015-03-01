
int lastFib;
int fib;
int dimX=600;
int dimY=600;

int x;
int y; 

int incX;
int incY;
int o;
int c=0;
int incC=1;
int n=2;

void setup() 
{
  frameRate(100);
  initParm1();
  initParm2();
  size(600, 600);
  background(0);
}
void draw()
{

  int save;



  for (int i=n;i>=0;i--) {
    stroke(i*255/n, i*255/n, i*255/n, 4);
    fill(i*255/n, i*255/n, i*255/n, 0);
    ellipse(x+random(-1*dimX/50, dimX/50), y+random(-1*dimX/50, dimX/50), fib+i*2, fib+i*2);
  }

  save=fib;
  fib=fib+lastFib;
  lastFib=save;
  o=o+1;
  c=c+incC;
  if (c<=0||c>=255) {
    incC=incC * -1;
    initParm1();
  }
  c=c+incC;

  if (o>20) {
    initParm1();
    initParm2();
  }
}

void initParm1() {


  x =  int( dimX/2 + random(dimX*.1) * cos(random(6.28)));
  y = int( dimY/2 + random(dimY*.1) * sin(random(6.28)));
}
void initParm2() {

  o=1;
  fib=1;
  lastFib=1;
}
void keyPressed()
{
  if ( key == 's' ) save(str(millis())+".jpg");
}



