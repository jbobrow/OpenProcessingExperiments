
 // using  sin() cos()  line() and ellipse()
 float rad1, rad2, incr, ampl, ang, move;

void setup() {
  size(500, 500);
  stroke(#B7FF03);
  strokeWeight(.2);
  incr = 0.01;
  ampl = 4;
}

void draw() {
  background(#460842);

  ang += incr;
  move = ampl * sin(ang);
  rad1 = width/2.2 + move;
  move = (move + radians(270)) * 4;
  rad2 = height/3.2 + move;

  translate(width/2, height/2);
  
  ellipse(0, 0, 10, 10); // middle
  
  // plot 2 sets of circumference points
  for (int i = 0; i < 360; i+=20) {
    float dx1 = (sin(radians(i)) * rad1);
    float dy1 = (cos(radians(i)) * rad1);
    for (int j = 0; j < 360; j+=10) {
      float dx2 = (sin(radians(j)) * rad2);
      float dy2 = (cos(radians(j)) * rad2);
      line(dx1, dy1, dx2, dy2); // join points as we go
      ellipse(dx2, dy2, 5, 5); 
    }
  }
}



