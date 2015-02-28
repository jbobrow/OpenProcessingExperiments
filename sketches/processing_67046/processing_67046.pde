

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  background(255);
  frameRate(30);
}

void draw() {
  background(255);
float a = random(10, 30);
float b = random(20, 100);
float c = random(10, 20);

  makeTeeth(a);
    
  makeEye(b, c);
  }

void makeTeeth(float a) {
  fill(6, 0, 159);
  int m = 0;
  for(int i=0; i < 500; i++){
    println(m);
    rect(m*i, m*i, a*i, a*i);
    m=m+5; 
    a=a+5;
  }
}

void makeEye(float b, float c) {
  fill(0);
  ellipse(350, 75, b, b);
  fill(255);
  ellipse(360, 75, c, c);
}

