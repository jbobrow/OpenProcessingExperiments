
int a = 0;
int b = 0;

void setup() {
  size(600, 600);
  stroke(255);
  frameRate(40);
  smooth();
  background(51);
}

void draw() {
  a = a + 1;
  b = b + 2; 
 
  fill(0);
  stroke(15);
  line(a+b, 0, a+b, height/2);
  
  fill(125);
  stroke(10);
  line(b-a, height/2, b+a, height);
  
  fill(255);
  stroke(30);
  line(a+b, 0, a-b, height/2);
  
  fill(0);
  stroke(30);
  line(b+a, height/2, b-a, height);

  fill(0);
  stroke(25);
  line(0, a-b, width/2, a+b);
  
  fill(255);
  stroke(18);
  line(width/2, b-a, width, b+a);
  
  fill(225);
  stroke(40);
  line(0, a+b, width/2, a-b);
  
  fill(255);
  stroke(40);
  line(width/2, b+a, width, b-a);
  
  if(a > width) {
    a = 0;
  }
  if(b > width) {
    b = 0;
  }
}

