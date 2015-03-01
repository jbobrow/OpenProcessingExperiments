
// sketch influenced by Ira Greenberg's
// "Creative Coding" book

float rad1, rad2, incr1, incr2;

void setup() {
  size(600, 600);
  rad1 = 999;
  rad2 = 750;
  incr1 = -2;
  incr2 = -2;
}

void draw() {
  background(220);
  stroke(0);
  fill(#C13EC1, 5);
  strokeWeight(.1);
  rad1 += incr1;
  rad2 += incr2;

  if (rad1 < -100) rad1 = -100;
  if (rad2 < -290) rad2 = -290;

  translate(width/2, height/2);

  // plot circumference points for two circles
  for (int i = 0; i < 360; i+=10) {
    float dx1 = (sin(radians(i)) * rad1);
    float dy1 = (cos(radians(i)) * rad1);
    for (int j = 0; j < 360; j+=45) {
      float dx2 = (sin(radians(j)) * rad2);
      float dy2 = (cos(radians(j)) * rad2);
      bezier(dx1, dy1, 
      dx1*0.33, dy1* 0.33, 
      dx2*0.66, dy2*0.66, 
      dx2, dy2);
    }
  }
}



