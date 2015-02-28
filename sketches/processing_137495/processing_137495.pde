


void setup () {
  size (400,400);
}

void draw () {
  background (70);
  noStroke();
  fill( 255,200);
  float x = 200.0;
  ellipse (x % 5, 200, x, x + 30);
  x = x * 1.7;
  ellipse (x - 50, 150, x, x - 100);
   x = x - 10;
  ellipse (x, 50, x, x * 1.3);
  
  stroke(2);
  line (0,x*0.5, 400, x);
  x= x*0.5;
  line (0,x * 0.5, 400, x);
   x= x*0.5;
  line (0,x * 0.5, 400, x);
  x= x*0.5;
  line (0,x * 0.5, 400, x);
   x= x*0.5;
  line (0,x * 0.5, 400, x);
}



