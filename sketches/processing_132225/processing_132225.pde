
float x = random(50, 650);
float y = random(50, 650);
float r = random(700);
float b = random(700);
float t = 0;
float xspeed =2;
float yspeed =2;
float xspeed2 = 2;
float yspeed2 = -2;
float xspeed3 = -2;
float yspeed3 = -2;
float xspeed4 = -2;
float yspeed4 = 2;

void setup() {
  size(700, 700);
  background(255);
  frameRate(60);
}

void draw() {
  /* x = x+xspeed;
   y = y+yspeed; */
  t = t+1;
  float m1 = random(3);
  float m2 = random(3);
  fill(x/random(4), random(255), y/3);
  strokeWeight(0.2);
  stroke(200);
  if (t <= 140) {
    xspeed = xspeed + m1*random(2); // large rects
    yspeed = yspeed + m2*random(2); 
    rect(x+xspeed, y+yspeed, 10, 10);
    xspeed2 = xspeed2 + m1*random(2);
    yspeed2 = yspeed2 + m2*random(-2); 
    rect(x+xspeed2, y+yspeed2, 10, 10);
    xspeed3 = xspeed3 + m1*random(-2);
    yspeed3 = yspeed3 + m2*random(-2); 
    rect(x+xspeed3, y+yspeed3, 10, 10);
    xspeed4 = xspeed4 + m1*random(-2);
    yspeed4 = yspeed4 + m2*random(2); 
    rect(x+xspeed4, y+yspeed4, 10, 10);
    fill(r/random(4), random(255), b/3); // medium rects
    xspeed = xspeed2 + m1*random(-4, 4);
    yspeed = yspeed2 + m2*random(-4, 4); 
    rect(x+xspeed2, y+yspeed2, 5, 5);
    xspeed2 = xspeed3 + m1*random(-4, 4);
    yspeed2 = yspeed3 + m2*random(-4, 4); 
    rect(x+xspeed3, y+yspeed3, 5, 5);
    xspeed3 = xspeed4 + m1*random(-4, 4);
    yspeed3 = yspeed4 + m2*random(-4, 4); 
    rect(x+xspeed4, y+yspeed4, 5, 5);
    xspeed4 = xspeed + m1*random(-4, 4);
    yspeed4 = yspeed + m2*random(-4, 4); 
    rect(x+xspeed, y+yspeed, 5, 5);
    fill(x/random(4)-100, random(255)-80, y/3-80); // small rects
    xspeed = xspeed2 + m1*random(-4, 4);
    yspeed = yspeed2 + m2*random(-4, 4); 
    rect(x+xspeed, y+yspeed, 2, 2);
    xspeed2 = xspeed3 + m1*random(-4, 4);
    yspeed2 = yspeed3 + m2*random(-4, 4); 
    rect(x+xspeed2, y+yspeed2, 2, 2);
    xspeed3 = xspeed4 + m1*random(-4, 4);
    yspeed3 = yspeed4 + m2*random(-4, 4); 
    rect(x+xspeed3, y+yspeed3, 2, 2);
    xspeed4 = xspeed + m1*random(-4, 4);
    yspeed4 = yspeed + m2*random(-4, 4); 
    rect(x+xspeed4, y+yspeed4, 2, 2);
    xspeed = xspeed4 + m1*random(-4, 4);
    yspeed = yspeed4 + m2*random(-4, 4); 
    rect(x+xspeed3, y+yspeed3, 2, 2);
    xspeed2 = xspeed2 + m1*random(-4, 4);
    yspeed2 = yspeed2 + m2*random(-4, 4); 
    rect(x+xspeed, y+yspeed, 2, 2);
    xspeed3 = xspeed + m1*random(-4, 4);
    yspeed3 = yspeed + m2*random(-4, 4); 
    rect(x+xspeed4, y+yspeed4, 2, 2);
    xspeed4 = xspeed3 + m1*random(-4, 4);
    yspeed4 = yspeed3 + m2*random(-4, 4); 
    rect(x+xspeed2, y+yspeed2, 2, 2);
     fill(r/random(4)-80, random(255)-80, b/3-80 ); // 2nd G small rects
    xspeed = xspeed2 + m1*random(-7, 7);
    yspeed = yspeed2 + m2*random(-7, 7); 
    rect(x+xspeed, y+yspeed, 2, 2);
    xspeed2 = xspeed3 + m1*random(-7, 7);
    yspeed2 = yspeed3 + m2*random(-7, 7); 
    rect(x+xspeed2, y+yspeed2, 2, 2);
    xspeed3 = xspeed4 + m1*random(-7, 7);
    yspeed3 = yspeed4 + m2*random(-7, 7); 
    rect(x+xspeed3, y+yspeed3, 2, 2);
    xspeed4 = xspeed + m1*random(-7, 7);
    yspeed4 = yspeed + m2*random(-7, 7); 
    rect(x+xspeed4, y+yspeed4, 2, 2);
    xspeed = xspeed4 + m1*random(-7, 7);
    yspeed = yspeed4 + m2*random(-7, 7); 
    rect(x+xspeed3, y+yspeed3, 2, 2);
    xspeed2 = xspeed2 + m1*random(-7, 7);
    yspeed2 = yspeed2 + m2*random(-7, 7); 
    rect(x+xspeed, y+yspeed, 2, 2);
    xspeed3 = xspeed + m1*random(-7, 7);
    yspeed3 = yspeed + m2*random(-7, 7); 
    rect(x+xspeed4, y+yspeed4, 2, 2);
    xspeed4 = xspeed3 + m1*random(-7, 7);
    yspeed4 = yspeed3 + m2*random(-7, 7); 
    rect(x+xspeed2, y+yspeed2, 2, 2);
  }
  if (t > 140) {
    t= 0;
    x = random(50, 650);
    y = random(50, 650);
    xspeed = 0;
    yspeed = 0;
    xspeed2 = 0;
    yspeed2 = 0;
    xspeed3 = 0;
    yspeed3 = 0;
    xspeed4 = 0;
    yspeed4 = 0;
  }
  if ((x > width) || (x<0)) {
    t= 0;
  }
  if ((y > height) || (y<0)) {
    t= 0;
  }
  if (mousePressed && (mouseButton == LEFT)) { // erase drawing
    background(255);
  }

}

