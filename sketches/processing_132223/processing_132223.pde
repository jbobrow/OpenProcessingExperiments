
float x= 0;
float y= 0;
float x2= 700;
float y2= 5;
float x3= 700;
float y3= 700;
float x4= 0;
float y4= 700;
float xspeed =1;
float yspeed =1;
float xspeed2 = 1;
float yspeed2 = -1;
float xspeed3 = -1;
float yspeed3 = -1;
float xspeed4 = -1;
float yspeed4 = 1;

void setup() {
  size(700, 700);
  background(255);
  frameRate(60);
}

void draw() {
  float m1 = random(3);
  float m2 = random(3);


  //1st rect
  x = x+xspeed;
  y = y+yspeed;


  fill(x/random(3), random(255), y/3);
  if (mousePressed && (mouseButton == LEFT)) { //make random movement
    xspeed = xspeed + m1*random(-1, 1);
    yspeed = yspeed + m2*random(-1, 1);
  }

  if (mousePressed && (mouseButton == RIGHT)) { // stop movement
    xspeed = xspeed - xspeed;
    yspeed = yspeed - yspeed;
  }
  if (mouseX > 350 && mouseY < 350) {
  }
  if ((x > width) || (x<0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y<0)) {
    yspeed = yspeed * -1;
  }

  strokeWeight(0.2);
  stroke(200);
  rect(x, y, 10, 10);

  //2nd rect 

  x2 = x2+xspeed2;
  y2 = y2+yspeed2;
  fill(x/random(4)-40, random(255)-40, y/3-40);
  if (mousePressed && (mouseButton == LEFT)) {
    xspeed2 = xspeed2 + m1*random(-2, 2);
    yspeed2 = yspeed2 + m2*random(-2, 2);
  }

  if (mousePressed && (mouseButton == RIGHT)) {
    xspeed2 = xspeed2 - xspeed2;
    yspeed2 = yspeed2 - yspeed2;
  }
  if (mouseX > 350 && mouseY < 350) {
  }
  if ((x2 > width) || (x2<0)) {
    xspeed2 = xspeed2 * -1;
  }
  if ((y2 > height) || (y2<0)) {
    yspeed2 = yspeed2 * -1;
  }

  strokeWeight(0.2);
  stroke(255);
  rect(x2, y2, 5, 5);

  // 3rd rect
  x3 = x3+xspeed3;
  y3 = y3+yspeed3;
  fill(x3/random(4), random(255), y3/3);
  if (mousePressed && (mouseButton == LEFT)) {
    xspeed3 = xspeed3 + m1*random(-2, 2);
    yspeed3 = yspeed3 + m2*random(-2, 2);
  }

  if (mousePressed && (mouseButton == RIGHT)) {
    xspeed3 = xspeed3 - xspeed3;
    yspeed3 = yspeed3 - yspeed3;
  }
  if (mouseX > 350 && mouseY < 350) {
  }
  if ((x3 > width) || (x3<0)) {
    xspeed3 = xspeed3 * -1;
  }
  if ((y3 > height) || (y3<0)) {
    yspeed3 = yspeed3 * -1;
  }

  strokeWeight(0.2);
  stroke(200);
  rect(x3, y3, 10, 10);

  //4th rect
  x4 = x4+xspeed4;
  y4 = y4+yspeed4;
  fill(x3/random(4)-40, random(255)-40, y3/3-40);
  if (mousePressed && (mouseButton == LEFT)) {
    xspeed4 = xspeed4 + m1*random(-2, 2);
    yspeed4 = yspeed4 + m2*random(-2, 2);
  }

  if (mousePressed && (mouseButton == RIGHT)) {
    xspeed4 = xspeed4 - xspeed4;
    yspeed4 = yspeed4 - yspeed4;
  }
  if (mouseX > 350 && mouseY < 350) {
  }
  if ((x4 > width) || (x4<0)) {
    xspeed4 = xspeed4 * -1;
  }
  if ((y4 > height) || (y4<0)) {
    yspeed4 = yspeed4 * -1;
  }

  strokeWeight(0.2);
  stroke(255);
  rect(x4, y4, 5, 5);
}

