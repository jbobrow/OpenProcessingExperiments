
long n;
long z;
long i;
int gerade;
int ungerade;
void setup() {
 n=(int)random(10000000, 100000000);
 //n=61779192;
  z=n;
  gerade=0;
  ungerade=0;
  i=0;
  size(800, 500);
  background(0);
}

void draw() {
   info();
  if (n==1) {
    println(""+verhaeltnis());
   //delay(2000);
    setup();
    return;
  }
  if (n % 2 == 0) {
    gerade++;
    stroke(0, 255, 0);
  }
  else {
    ungerade++;
    stroke(255, 0, 0);
  }
  long ln= n> height ? height : n;
  line(i, height, i, height-ln);
  n=collatz(n);
  i+=2;
}
void info() {
  noStroke();
  int abst=40;
  rect(width-150, 0, width, abst*6);
  smooth();
  fill(255);
  int l=40;

  text ("Zahl:"+z, width-150, l+=abst);
  text ("Gerade:"+gerade, width-150, l+=abst);
  text ("Ungerade:"+ungerade, width-150, l+=abst);
  text ("Verhältnis:"+verhaeltnis(), width-150, l+=abst);
  noSmooth();
  fill(0);
}
double verhaeltnis(){
  return (float)gerade/(float)ungerade;
}
long collatz(long n) {
  return (n % 2) == 0 ? n /2 : 3 * n + 1;
}


