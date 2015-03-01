
float a = 150.0;
float b = 20.0;
float c = 180.0;
float d = 200.0;
float e = 250.0;
float f = 260.0;
float speed = 2.0;
int direction = 1;
void setup (){
  size (300, 300);
  smooth ();
  noStroke ();
  
}

void draw (){
  background (162, 232, 202);
  fill (36, 214, 222, 65);
  triangle (a, 0, b, 300, c, 300);
  fill (22, 36, 123, 100);
  triangle (d, 0, e, 300, f, 0);
  fill (115, 252, 5, 105);
  triangle (0, a, 300, b, 300, c);
  fill (252, 5, 212, 100);
  triangle (0, d, 300, e, 0, f);
  a += speed * direction;
  d -= speed * direction;
  b = a -100;
  c = a + 100;
  e = d + 250;
  f = d + 200;
  if ((a> width) || (a < width/10) || (d > width) || (d < width/10)){
    direction = - direction;
  }
}

  


