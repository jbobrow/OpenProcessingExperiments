
// sketch influenced by Ira Greenberg'
// "Creative Coding" book. Ch7 Curves
float rad1, rad2, incr1, incr2;
int sze;
void setup() {
  sze = 300;
  //size(sze*2, sze*2);// not in JsMode
  size(600, 600);
  rad1 = 100;
  rad2 = 100;
  incr1 = 1.3;
  incr2 = 1;
}

void draw() {
  background(#460842);
  stroke(#B7FF03);
  fill(255, 0, 0, 15);
  strokeWeight(.2);
  rad1 += incr1;
  rad2 += incr2;
  if (rad1 > sze || rad1 < -sze) incr1 *= -1;
  if (rad2 > sze || rad2 < -sze) incr2 *= -1;

  translate(width/2, height/2);

  // plot circumference points 
  for (int i = 0; i < 360; i+=30) {
    float dx1 = (sin(radians(i)) * rad1);
    float dy1 = (cos(radians(i)) * rad1);
    for (int j = 0; j < 360; j+=30) {
      float dx2 = (sin(radians(j)) * rad2);
      float dy2 = (cos(radians(j)) * rad2);
      bezier(dx1/4, dy1/4, 
      dx1, dy1, 
      dx2/2, dy2/2, 
      dx2, dy2);
    }
  }
}



