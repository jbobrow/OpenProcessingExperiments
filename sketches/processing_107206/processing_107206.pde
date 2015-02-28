
int a;
int b;
int f;
// try and autmate/add up fibonacci sequence
void setup() {
  size(800, 400);
  background(0);
  textSize(256);
  smooth();
  a = 2;
  b = 3;
}

void draw() {
  background(0);
  fill(255);
//  println("at start of draw a:"+a+" b:"+b+" f:"+f);
  f = a + b;
//  println("at end of draw a:"+a+" b:"+b+" f:"+f);
  text(f, width/8, height/4*3);
}


void keyPressed() {
//  println("at key press before a:"+a+" b:"+b+" f:"+f);
  a = b;
  println("at key press during a:"+a+" b:"+b+" f:"+f);
  b = f;
//  println("at key press final a:"+a+" b:"+b+" f:"+f);
}
