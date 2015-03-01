

float a=0;

void setup() {
  background(255);
  size(400, 400);
}

void draw() {

  //left-up
  stroke(255,0,0);
  line(0, 0, a, 200-a);
  //right-up
  stroke(0,255,0);
  line(400, 0, 400-a, 200-a);
  //left-bottom
  stroke(0,0,255);
  line(0, 400, a, 200+a);
  //right-bottom
  stroke(100,0,255);
  line(400, 400, 400-a, 200+a);
  a = a+5;
  println(a);
}



