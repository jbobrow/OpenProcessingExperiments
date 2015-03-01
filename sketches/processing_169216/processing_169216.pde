

float a=0;

void setup() {
  background(255);
  size(400, 400);
}

void draw() {

  /*lines that becomes dots. limits applied to pixels*/
  //left-up
  line(0, 0, a, 200-a);
  //right-up
  line(400, 0, 400-a, 200-a);
  //left-bottom
  line(0, 400, a, 200+a);
  //right-bottom
  line(400, 400, 400-a, 200+a);
  //vertical dotted line 
  line(0+a, 200, 0+a, 200);
  //horizontal dotted line
  line(200, 0+a, 200, 0+a);
  //diagonal dotted line I
  line(100+a, 100+a, 100+a, 100+a);
  //diagonal dotted line II
  line(300-a, 100+a, 300-a, 100+a);
  a = a+5;
  println(a);
}



