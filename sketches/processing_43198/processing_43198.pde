
float x = 0;
float y = 0;
float xspeed = 1.2-(y);
float yspeed = HALF_PI;
float r = 32+.2*y;
float pee = random(10, 254);
void setup() {
  size (400, 500);
  frameRate(30);
}

void draw() {

  x = x + xspeed-(y/254);
  y = y + yspeed;

  if ((x > width) || (x < 01 )) {
    xspeed = xspeed * -1;
  }

  xspeed = Y*xspeed+(x/90000);

  //if (( y > height) || (y < 1)) {
  yspeed = yspeed *-1;
  // }

  strokeWeight(3);
  stroke(x+(y*.2)-x, y+((24-y)+(.5*x))-xspeed*3, (y*1)-(x*yspeed));
  noFill();
  // fill(20*r%y+, x*70, 50+.5*y);
  ellipse (x, y, 100, 100);

  fill(30, 30, 30);
   strokeWeight(5);
    stroke(x+(x*.2)-x, x+((24-x)+(.5*y))-xspeed*3, (y*1)-(y*yspeed));

  rect(150, 150, 200, 200);
  r = constrain(10, 1, 100);
}


void keyPressed() {
  save("doop.tiff");
}

