
float a=5;
float x=150;
float r;
float g;
float b;

void setup() {
  size(300, 300);
  float num1=.1;
  float num2=.1;
}

void draw() {
  background(150);
  r=random(255);
  g=random(255);
  b=random(255);
  noFill();
  strokeWeight(5);
  arc(x,height/2,100,100,a,a+PI);
  a=a+0.1;
  x=x+1;
  
  if (mousePressed == true) {
   stroke(r,g,b);
  }
  
  if (x>300) {
    x=0;
  }
}

