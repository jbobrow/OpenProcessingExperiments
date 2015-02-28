
//ball-1
float x = random(0,300);
float y = random(0,300);
float xspeed = random(2,5);
float yspeed = random(1,5);
float r = 0;

//ball-2
float x2 = random(0,300);
float y2 = random(0,300);
float x2speed = random(2,5);
float y2speed = random(1,5);
float r2 = 0;

//ball-3
float x3 = random(0,300);
float y3 = random(0,300);
float x3speed = random(2,5);
float y3speed = random(1,5);
float r3 = 0;


void setup() {
  size(900,900);
  background(0);
  smooth();
  noStroke();
}

void draw() {

  noStroke();

  x = x + xspeed;
  y = y + yspeed;
  x2 = x2 + x2speed;
  y2 = y2 + y2speed;
  x3 = x3 + x3speed;
  y3 = y3 + y3speed;
  
//ball-1
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  noFill(); stroke(x/3,y/3,random (0,255));
  ellipse(x,y,r,r);
  
  r = 0;
  
//ball-2
  if ((x2 > width) || (x2 < 0)) {
    x2speed = x2speed * -1;
  }
  
  if ((y2 > height) || (y2 < 0)) {
    y2speed = y2speed * -1;
  }

  noFill(); stroke(y2/3,random (0,255),x2/3);
  ellipse(x2,y2,r2,r2);
  
  r2 = 0;

//ball-3
  if ((x3 > width) || (x3 < 0)) {
    x3speed = x3speed * -1;
  }
  
  if ((y3 > height) || (y3 < 0)) {
    y3speed = y3speed * -1;
  }

  noFill(); stroke(random (0,255),x3/3,y3/3);
  ellipse(x3,y3,r3,r3);
  
  r3 = 0;
  stroke(x/3,y/3,random(0,255));
  line(x,y,x2,y2);
  stroke(random(0,255),x/3,y/3);
  line(x2,y2,x3,y3);
  stroke(x/3,random(0,255),y/3);
  line(x,y,x3,y3);
  
}

