
// sketch influenced by Ira Greenberg's "Creative Coding" book
// "stars" made with sin(), cos() and line()
// this is 'lineStar' version 2: different rendering approach and multiple "stars"

float r, g, b, rIncr, gIncr, bIncr, r2, g2, b2;
float rad1, rad2, incr1, incr2;
int sze, num1, num2;

void setup() {
  sze = 300;
  //size(sze*2, sze*2); // not in jsMode
  size(650, 650);
  rad1 = rad2 = 0;
  num1 = num2 = 45;
  rIncr = gIncr = bIncr = .1;
  incr1 = .3;
  incr2 = .5;
  r = 0;
  g = 100;
  b = 200;
  r2 = g2 = b2 = 255;
}

void draw() {
  fill(104);
  textSize(15);
  text("mouse click for new star", 15, height-12 );
  chngCol();
  fill(r, g, b, 2);
  stroke(0);
  strokeWeight(20);
  rect(0, 0, width, height);
  rad1 += incr1;
  rad2 += incr2;
  if (rad1 > sze || rad1 < -sze) incr1 *= -1;
  if (rad2 > sze || rad2 < -sze) incr2 *= -1;

  translate(width/2, height/2);

  // plot circumference points 
  for (int i = 0; i < 360; i+=num1) {
    float dx1 = (sin(radians(i)) * rad1);
    float dy1 = (cos(radians(i)) * rad1);
    for (int j = 0; j < 360; j+=num2) {
      float dx2 = (sin(radians(j)) * rad2);
      float dy2 = (cos(radians(j)) * rad2);
      stroke(r2, g2, b2);
      strokeWeight(1);
      line(dx1, dy1, dx2, dy2); // connect points
      stroke(0);
      strokeWeight(.5);
      line(dx1, dy1, dx2, dy2); // and again in black
    }
  } 
}

void chngCol() {
  r += rIncr;
  if (r > 255 || r < 0) rIncr *= -1;
  g += gIncr;
  if (g > 255 || g < 0) gIncr *= -1;
  b += bIncr;
  if (b > 255 || b < 0) bIncr *= -1;
}

int selectNum() {
  int n ;
  while (true) {
    n = int(random (30, 360));
    if (360 % n == 0) return n;
  }
}

void mousePressed() {
  num1 = selectNum();
  num2 = selectNum();
  r2 = random(100, 255); 
  g2 = random(100, 255); 
  b2 = random(100, 255);
}



