
float x = 0;

void setup() {
  size(800,600); 
  background(0);
}

void draw() {
  background(0);
  x += 0.1;
  circle1();
  circle2();
  circle3();
  circle4();
}

void circle1() {
  translate(400,300);
  fill(255,255,0);
  ellipse(0,0,55,55);
}

void circle2() {
  rotate(radians(x));
  translate(200,0);
  fill(0,0,139);
  ellipse(0,0,40,40);
}
  
void circle3() {
  rotate(radians(x*8));
  translate(100,0);
  fill(169,169,169);
  ellipse(0,0,25,25);
}
  
void circle4() {
  rotate(radians(x*16));
  translate(50,0);
  fill(255);
  ellipse(0,0,10,10);
}
