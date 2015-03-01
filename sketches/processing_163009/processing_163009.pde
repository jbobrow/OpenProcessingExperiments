
float x;
float y;
float xspeed = 1.9;
float yspeed = 1;
float a;
float b;
float aspeed = -1.9;
float bspeed = -1;
float c;
float d;
float cspeed = -1.9;
float dspeed = -1;
float s = 1; //ball size
color bcolor = color(23,23,200,80);
color lcolor = color(0,80);
boolean fade = false;


void setup() {
  background(230);
  size(600, 600);
  frameRate(300);
  x = random(width);
  y = random(height);
  a = random(width);
  b = random(height);
  c = random(width);
  d = random(height);
}

void draw() {
if (fade == false){
  noStroke();
  fill(255, 5);
  rect(0, 0, width, height);
}

  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;
  a = a + aspeed;
  b = b + bspeed;
  c = c + cspeed;
  d = d + dspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  // Check for bouncing
  if ((a > width) || (a < 0)) {
    aspeed = aspeed * -1;
  }
  // Check for bouncing
  if ((c > width) || (c < 0)) {
    cspeed = cspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  if ((b > height) || (b < 0)) {
    bspeed = bspeed * -1;
  }
  if ((d > height) || (d < 0)) {
    dspeed = dspeed * -1;
  }


  // Display at x,y location
  fill(bcolor);
  ellipse(x, y, s, s);
  ellipse(a, b, s, s);
  ellipse(c, d, s, s);

  //draw line between
  noFill();
  stroke(lcolor);
  triangle(x, y, a, b, c, d);

//fade lines

  if (keyPressed == true) {
    if (fade == false)
    fade = true;
  } else {
    fade = false;
  }
}
//stop show
void mousePressed(){
  stop();
}

