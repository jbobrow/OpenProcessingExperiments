
//Global Variables
float diameter; 
float angle = 0;
float x = 0;
float y = 0;
float scale;
float CircleX;
float CircleY;
float xspeed = 4;
float yspeed = 4;
float b = 0;
float t = 1;
float c = 255;
float u = 1;


void setup() {
  size(601, 601);
  diameter = height - 10;
  strokeWeight(3);
  noFill();
}


void draw() {
  background(b);
  b = b + t;
  if (b > 255) {
    t = -1;
  }
  if (b < 0) {  
    t = 1;
  }

  backgroundGrid();
  scalingEllipse();
  sineEllipeses();
}


//////FUNCTIONS//////

//New Function: draw ellipse and line grids
void backgroundGrid() {

  strokeWeight(.67);
  stroke(c);
  c = c + u;
  if (c > 255) {
    u = -1;
  }
  if (b < 0) {  
    u = 1;
  }

  for (x = 0; x < width * 2; x = x + 40) {
    ellipse(width/2, height/2, x, x);
  }

  for (x = 0; x < width * 2; x = x + 20) {
    line(x, 0, x, height);
  }

  for (y = 0; y < height; y = y + 20) {
    line(0, y, width, y);
  }
}

//New Function: animate expanding and contracting white ellipse
void scalingEllipse() {

  stroke(255);
  strokeWeight(5);
  ellipse(width/2, height/2, CircleX, CircleY);

  CircleX = CircleX + xspeed;
  CircleY = CircleY + yspeed;

  if (CircleX > width || CircleX < 1) {
    xspeed = xspeed * -1;
  }
  if (CircleY > height  || CircleY < 1) {
    yspeed = yspeed * -1;
  }
}

//New Function: animate sine scaling ellipses
void sineEllipeses() {

  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;

  strokeWeight(5);

  stroke(255, 0, 0);
  ellipse(width/2, height/2, d1, d1);
  ellipse(width/2, height/2, d1, d2);
  ellipse(width/2, height/2, d1, d3);
  stroke(0, 255, 0);
  ellipse(width/2, height/2, d2, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width/2, height/2, d2, d3);
  stroke(0, 0, 255);
  ellipse(width/2, height/2, d3, d1);
  ellipse(width/2, height/2, d3, d2);
  ellipse(width/2, height/2, d3, d3);

  angle += 0.02;
}



