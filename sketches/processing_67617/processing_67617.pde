
float sun_x = 0;
float sun_y = 0;
float moon_x = 400;
float moon_y = 0;
float green_y = 0;
void setup() {
  size(400,400);
  background(200,0,200);
  frameRate(25);
}
void draw() {
  noStroke();
  fill(random(0,100),random(200,255),random(200,255));
  ellipse(sun_x,sun_y,100,100);
  sun_x = sun_x + 1;
  sun_y = sun_y +1;
  if(sun_x > 400) {
    sun_x = 0;
  }
  if(sun_y > 400) {
    sun_y = 0;
  }
  noStroke();
  fill(random(200,255),random(200,255),random(0,100));
  ellipse(moon_x,moon_y,100,100);
  moon_x = moon_x - 1;
  moon_y = moon_y + 1;
  if(moon_x < 0) {
    moon_x = 400;
  }
  if(moon_y > 400) {
    moon_y = 0;
  }
  noStroke();
  fill(random(0,100),random(200,256),random(0,100));
  ellipse(200,green_y,100,100);
  green_y = green_y + 1;
  if(green_y > 400) {
    green_y = 0;
  }
  noStroke();
  fill(random(256));
  triangle(200,200,random(400),random(400),random(400),random(400));
}

