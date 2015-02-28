
//ball-1
float x = random(0,300);
float y = random(0,300);
float xspeed = random(2,5);
float yspeed = random(1,5);
float r = 00;

//ball-2
float x2 = random(0,300);
float y2 = random(0,300);
float x2speed = random(2,5);
float y2speed = random(1,5);
float r2 = 00;

//ball-3
float x3 = random(0,300);
float y3 = random(0,300);
float x3speed = random(2,5);
float y3speed = random(1,5);
float r3 = 00;

//ball-4
float x4 = random(0,300);
float y4 = random(0,300);
float x4speed = random(2,5);
float y4speed = random(1,5);
float r4 = 00;


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
  x4 = x4 + x4speed;
  y4 = y4 + y4speed;
  
//ball-1
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  noFill(); stroke(x/3,y/3,random (0,255));
  ellipse(x,y,r,r);
  
  r = constrain(r-2,00,80);
  
//ball-2
  if ((x2 > width) || (x2 < 0)) {
    x2speed = x2speed * -1;
  }
  
  if ((y2 > height) || (y2 < 0)) {
    y2speed = y2speed * -1;
  }

  noFill(); stroke(y2/3,random (0,255),x2/3);
  ellipse(x2,y2,r2,r2);
  
  r2 = constrain(r2-2,00,80);

//ball-3
  if ((x3 > width) || (x3 < 0)) {
    x3speed = x3speed * -1;
  }
  
  if ((y3 > height) || (y3 < 0)) {
    y3speed = y3speed * -1;
  }

  noFill(); stroke(random (0,255),x3/3,y3/3);
  ellipse(x3,y3,r3,r3);
  
  r3 = constrain(r3-2,00,80);
  
  //ball-4
  if ((x4 > width) || (x4 < 0)) {
    x4speed = x4speed * -1;
  }
  
  if ((y4 > height) || (y4 < 0)) {
    y4speed = y4speed * -1;
  }

  noFill(); stroke(random (0,255),x4/3,y4/3);
  ellipse(x4,y4,r4,r4);
  
  r4 = constrain(r4-2,00,80);
  
colorMode(HSB, 360, 100, 100,360);
stroke(random(0,360),20,20,random(0,360));
  line(x,y2,y,x2);
  line(x2,y3,y2,x3);
  line(x,y4,y,x4);
  line(x3,y4,y3,x4);
}

