
int num = 8;
int num1 = 15;
int num2 = 18;

float step, sz, sz1, offSet, sz2, offSet2, offSet1, theta, theta2;

void setup() {
  frameRate(90);
  size(600, 600);
  strokeWeight(6);
  step = 54;
}

void draw() {
  //background(#F1F0EB);
  //background(#F1F0EB);
  background(15);
  
  translate(600, 422.5);
  rotate(PI);
  colorMode(HSB, 255, 10, 100);
  for (int e=0; e<num1; e++) {
    float s1 = map(e, 0, num1, 60, 80);
    stroke(s1, 90, 90);
    noFill();
    sz1 = e*step;
    float offSet1 = TWO_PI/num1*e;
    float arcEnd1 = map(sin(theta2+offSet1/2), -1.2, 1, PI, TWO_PI+PI/90);
    arc(width/2, height/10, sz1, sz1, PI, arcEnd1);
  }
  colorMode(RGB);
  resetMatrix();
  
  colorMode(HSB, 255, 10, 100);
  for (int a=0; a<num2; a++) {
    float s2 = map(a, 0, num2, 130, 155);
    stroke(s2, 90, 90);
    noFill();
    sz2 = a*step;
    float offSet2 = TWO_PI/num2*a;
    float arcEnd2 = map(sin(theta+offSet2/2), -1, 1, PI, TWO_PI+PI/90);
    arc(width/2, height/1.6666, sz2, sz2, PI, arcEnd2);
  }
  
  
  translate(0, height*.5);
  colorMode(HSB, 255, 10, 100);
  for (int i=0; i<num; i++) {
    float s = map(i, 0, num, 40, 20);
    stroke(s, 90, 90);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet/2), -1, 1, PI, TWO_PI+PI/90);
    arc(width/2, height/10, sz, sz, PI, arcEnd);
  }
  theta += .0323;
  theta2 += .0240;
}
