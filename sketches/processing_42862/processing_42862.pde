
//ball-1
float x = random(0,300);
float y = random(0,300);
float xspeed = random(2,5);
float yspeed = random(1,5);
float r = 32;

//ball-2
float x2 = random(0,300);
float y2 = random(0,300);
float x2speed = random(2,5);
float y2speed = random(1,5);
float r2 = 32;

//ball-3
float x3 = random(0,300);
float y3 = random(0,300);
float x3speed = random(2,5);
float y3speed = random(1,5);
float r3 = 32;


void setup() {
  size(700,700);
  smooth();
  noStroke();
}

void draw() {
  background(255);
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
    r = 80;
  }
  
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
    r = 80;
  }

  fill(x/3,y/3,y/3);
  ellipse(x,y,r,r);
  
  r = constrain(r-2,32,80);
  
//ball-2
  if ((x2 > width) || (x2 < 0)) {
    x2speed = x2speed * -1;
    r2 = 80;
  }
  
  if ((y2 > height) || (y2 < 0)) {
    y2speed = y2speed * -1;
    r2 = 80;
  }

  fill(y2/3,x2/3,x2/3);
  ellipse(x2,y2,r2,r2);
  
  r2 = constrain(r2-2,32,80);

//ball-3
  if ((x3 > width) || (x3 < 0)) {
    x3speed = x3speed * -1;
    r3 = 80;
  }
  
  if ((y3 > height) || (y3 < 0)) {
    y3speed = y3speed * -1;
    r3 = 80;
  }

  fill(y3/3,x3/3,y3/3);
  ellipse(x3,y3,r3,r3);
  
  r3 = constrain(r3-2,32,80);
  stroke(0);
  line(x,y,x2,y2);
  line(x2,y2,x3,y3);
  line(x,y,x3,y3);
  
}

