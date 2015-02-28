
int a;
int b;
int f;
int a2;
int b2;
int f2;
// try and autmate/add up fibonacci sequence
void setup() {
  size(800, 800);
  background(0);
  textSize(144);
  smooth();
  a = 1;
  b = 1;
  a2 = 1;
  b2 = 2;
}

void draw() {
  background(0);
  
//  println("at start of draw a:"+a+" b:"+b+" f:"+f);
  f = a + b;
  f2 = a2 + b2;
  
  rectMode(CENTER);
  fill(255, 255, 0);
  rect(width/2, height/2, f, f2);
//  println("at end of draw a:"+a+" b:"+b+" f:"+f);
  fill(255);
  text(f, width/8, height/4*3);
  
  text(f2, width/8, height/4);
  
  
}


void keyPressed() {
//  println("at key press before a:"+a+" b:"+b+" f:"+f);
  a = b;
  a2 = b2;
  //println("at key press during a:"+a+" b:"+b+" f:"+f);
  b = f;
  b2 = f2;
//  println("at key press final a:"+a+" b:"+b+" f:"+f);
  
}
