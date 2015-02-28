
int a;
int b;
int c;
int m = 0;
int n = 0;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
//  background(255);
}

void draw() {
  a = int(random(10,30));
  b = int(random(20,100));
  c = int(random(10,20));
  makeTeeth(a);
  makeEye(b, c);
  }

void makeTeeth(int a) {
  fill(6, 0, 159);
  for(int i=0; i < width; i+=10){
  rect(m, m, a, a);
    m=m+5; 
    a=a+5;
  }
}

void makeEye(int b, int c) {
  fill(0);
  ellipse(350, 75, b, b);
  fill(255);
  ellipse(360, 75, c, c);
}

