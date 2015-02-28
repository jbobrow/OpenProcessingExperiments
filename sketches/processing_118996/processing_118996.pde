
// janice pang
// october 31, 2013
// wallpaper 1: a good night's sleep helps the brain engage in creative connections throughout the day

// document variables
int scrn = 1000; // screen size

// color variables
int r = 23; // red
int g = 44; // green
int b = 60; // blue
boolean i = true; // increases color until...

// arc variables; global variable = draws once in setup
float arcStart = scrn/2; // starts arc at center of screen
float arcSize = scrn/5; // arc will be one-fifth of screen size
float arc1 = random(0, 360); // randomized arc start point
float arc2 = random(arc1, arc1+360); // randomized arc end point; value will always be greater than arc

void setup() {
  size(scrn, scrn);
  frameRate(20);
  stroke(0);

  smooth();
}

void draw() {
  background(r, g, b);
  // line variables
  float lineEnd_x4 = random(0, 1000); // bottom right quadrant = great sleep + connectivity
  float lineEnd_y4 = random(0, 1000); // bottom right quadrant = great sleep + connectivity
  float lineEnd_x3 = random(100, 900); // bottom left quadrant = good sleep + connectivity
  float lineEnd_y3 = random(100, 900); // bottom left quadrant = good sleep + connectivity
  float lineEnd_x2 = random(200, 800); // top right quadrant = okay sleep + connectivity
  float lineEnd_y2 = random(200, 800); // top right quadrant = okay sleep + connectivity
  float lineEnd_x1 = random(300, 700); // top left quadrant = poor sleep + connectivity
  float lineEnd_y1 = random(300, 700); // top left quadrant = poor sleep + connectivity
  int lineStart = scrn/2; // starts line at center of screen
  color lineColor = color(#ffffff);

  // ellipse size
  float ellipseSize4 = random(lineEnd_x4/40);
  float ellipseSize3 = random(lineEnd_x3/60);
  float ellipseSize2 = random(lineEnd_x2/80);
  float ellipseSize1 = random(lineEnd_x1/100);

  //----------------------------- draw pink arc
  // how much sleep you need
  fill(#995052); // pink
  arc(arcStart, arcStart, arcSize, arcSize, radians(arc2), radians(arc1+360));


  //----------------------------- draw lines
  if (arc2-arc1 >= 315) { // plenty of sleep
    // stroke
    stroke(lineColor, 150);
    line(lineStart, lineStart, lineEnd_x4, lineEnd_y4); // random line 1
    // ellipse
    fill(255);
    noStroke();
    ellipse(lineEnd_x4, lineEnd_y4, ellipseSize4, ellipseSize4); // ellipse base
  }
  else if (arc2-arc1 >= 225) { // good amount of sleep
    // stroke
    stroke(lineColor, 100);
    line(lineStart, lineStart, lineEnd_x3, lineEnd_y3);  // random line 1
    // ellipse
    fill(255);
    noStroke(); 
    ellipse(lineEnd_x3, lineEnd_y3, ellipseSize3, ellipseSize3);
  }
  else if (arc2-arc1 >= 180) { // at least half the sleep
    // stroke
    stroke(lineColor, 50);
    line(lineStart, lineStart, lineEnd_x2, lineEnd_y2);  // random line 1
    // ellipse
    fill(255);
    ellipse(lineEnd_x2, lineEnd_y2, ellipseSize2, ellipseSize2);
  }
  else { // not enough sleep
    // stroke
    stroke(lineColor, 10);
    line(lineStart, lineStart, lineEnd_x1, lineEnd_y1);  // random line 1
    // ellipse
    fill(255);
    noStroke();
    ellipse(lineEnd_x1, lineEnd_y1, ellipseSize1, ellipseSize1);
  }


  //---------------------draw arcs
  noStroke();

  // how much sleep you're getting
  fill(#274862); // light blue 
  arc(arcStart, arcStart, arcSize, arcSize, radians(arc1), radians(arc2));

  // the stages of the sleep you're getting
  int j = 20;
  fill(#000000, j);
  arc(arcStart, arcStart, arcSize, arcSize, radians(arc1), radians(arc1+((abs(arc1-arc2)/10)))); // half
  arc(arcStart, arcStart, arcSize, arcSize, radians(arc1), radians(arc1+((abs(arc1-arc2)/5)))); // half
  arc(arcStart, arcStart, arcSize, arcSize, radians(arc1), radians(arc1+((abs(arc1-arc2)/3)))); // half
  arc(arcStart, arcStart, arcSize, arcSize, radians(arc1), radians(arc1+((abs(arc1-arc2)/1.75)))); // half





  // change the r value
  if (r <= 153) {
    i = true;
  }
  else if (r >= 23) {
    i = false;
  }

  if (i) {
    r++;
  }
  else if (!i) {
    r-=1;
  }


  // change the g value

  if (g <= 80) {
    i = true;
  }
  else if (g >= 44) {
    i = false;
  }

  if (i) {
    g++;
  }
  else if (!i) {
    g-=1;
  }


  // change the b value

  if (b <= 82) {
    i = true;
  }
  else if (b >= 60) {
    i = false;
  }

  if (i) {
    b++;
  }
  else if (!i) {
    b-=1;
  }
}


// =^. .^=
