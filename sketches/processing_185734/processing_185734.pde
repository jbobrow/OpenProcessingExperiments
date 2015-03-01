
//sketch influenced by Ira Greenberg's "Creative Coding" book
// "star" built using sin() cos() and line()
float rad1, rad2, incr1, incr2;
int sze;
void setup() {
  sze = 300;
  //size(sze*2, sze*2);// not in jsMode
  size(600, 600);
  rad1 = 0;
  rad2 = 0;
  incr1 = .3;
  incr2 = .5;
}

void draw() {
  fill(#206723, 10);
  rect(0,0,width, height);
  
  rad1 += incr1;
  rad2 += incr2;
  if (rad1 > sze || rad1 < -sze) incr1 *= -1;
  if (rad2 > sze || rad2 < -sze) incr2 *= -1;

  translate(width/2, height/2);

  // plot circumference points for two circles
  for (int i = 0; i < 360; i+=30) {
    float dx1 = (sin(radians(i)) * rad1);
    float dy1 = (cos(radians(i)) * rad1);
    for (int j = 0; j < 360; j+=30) {
      float dx2 = (sin(radians(j)) * rad2);
      float dy2 = (cos(radians(j)) * rad2);
      stroke(#B7FF03);
      strokeWeight(1.1);
      line(dx1, dy1, dx2, dy2); // connect points
      stroke(0);
      strokeWeight(1);
      line(dx1, dy1, dx2, dy2);// and again 
    }
  }
}



