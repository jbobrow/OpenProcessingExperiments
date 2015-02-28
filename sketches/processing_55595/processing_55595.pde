
/*
  Fibonacci lengthed cuts 
  form a closed shape 
  on a circle.
  By SergeiSokolov
  www.sergeisokolov.com
*/
float p;

float R = 150;
int N;

void setup() {
  size(400,400);
  smooth();
  background(255);
  frameRate(25);
  N = 7;
  decor();
}

void draw() {
  p += (mouseX - p) / 40;
  N = round( map( mouseY, 0, height, 4, 20));
  background(255);
  decor();
  dropPerps(N, p);
}

void dropPerps(int N, float k) {
  float da, a=0, x, y, miniR;
  k = R / fibonacci(N) - k/100;
  pushMatrix();
  translate( width/2, height/2);
  rotate( -HALF_PI);
  fill( 190); stroke(30);
  for(int i=1; i<=N; i++) {
    da = asin( k*fibonacci(i) / R);
    beginShape();
    vertex(0,0);    
    x = R*cos(a + da); y = -R*sin(a + da);
    vertex(x, y);
    miniR = R*cos(da);
    vertex(miniR*cos(a), -miniR*sin(a));
    endShape(CLOSE);

    beginShape();
    vertex(0,0);    
    x = R*cos(a + da); y = R*sin(a + da);
    vertex(x, y);
    miniR = R*cos(da);
    vertex(miniR*cos(a), miniR*sin(a));
    endShape(CLOSE);



    a += da;
  }
  popMatrix();
}

void plot( float a) {
  float x, y;
    line( 0, 0, R, 0);
    x = R*cos(a); y = -R*sin(a);
    line( 0, 0, x, y);
    line( x, y, x, 0);
}

int fibonacci(int A) { // returns fibonacci number
  int Sa = 0, Sb = 1, S = 0;
  if( A==0) return 0;
  if( A==1) return 1;
  for(int i=1; i<A; i++) {
    S = Sa + Sb;
    Sa = Sb;
    Sb = S;
  }
//  println(A+": "+S);
  return S;
}

void decor() {
  pushMatrix();
  translate( width/2, height/2);
  noFill(); stroke(80);
  ellipse(0, 0, 2*R, 2*R);
  line(-R, 0, R, 0);
  line( 0,-R, 0, R);
  
  popMatrix();
}

