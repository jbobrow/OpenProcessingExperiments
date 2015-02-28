
//squares
int dots = 100;
int [] x = new int[dots];
int [] y = new int [dots];

//meteor 
int circleXpos;
int circleYpos;
int xvel;
int yvel;
int circlewidth;

//color
int c;

void setup() {
  size (500, 500);
  noStroke();
  background(0);

  xvel = 5;
  yvel = 5;
  c = 0;
  circlewidth = 0;
}


void draw() {
  //make background gray for fade effect
  fill(0, 12);
  rect(0, 0, width, height);

  //squares
  fill(255);
  for (int i = 0; i < dots; i++) {
    x[i] = int (random(width));
    y[i] = int (random(height));
    rect (x[i], y[i], 10, 10);
  }
  //meteor
  fill(c, 0, 0);
  c= circleYpos/2;
  circleXpos = circleXpos + xvel;
  circleYpos = circleYpos + yvel;
  circlewidth = circleYpos/20;
  ellipse(circleXpos, circleYpos, circlewidth, circlewidth);

  if (circleXpos > width || circleYpos > height) {
    circleXpos = 0 + xvel;
    circleYpos = 0 + yvel;
  }
}


