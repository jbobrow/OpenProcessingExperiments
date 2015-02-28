
float x = 0;
float y = 0;
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

  float m1 = random(5);
  float m2 = random(5);
  fill(mouseX/random(4), random(255), mouseY/3);
  strokeWeight(0.2);
  stroke(200);
  if (mousePressed && (mouseButton == LEFT)) {
    xspeed = xspeed + m1*random(-2, 2); // large rects
    yspeed = yspeed + m2*random(-2, 2); 
    rect(mouseX+xspeed, mouseY+yspeed, 10, 10);
    xspeed2 = xspeed2 + m1*random(-2, 2);
    yspeed2 = yspeed2 + m2*random(-2, 2); 
    rect(mouseX+xspeed2, mouseY+yspeed2, 10, 10);
    xspeed3 = xspeed3 + m1*random(-2, 2);
    yspeed3 = yspeed3 + m2*random(-2, 2); 
    rect(mouseX+xspeed3, mouseY+yspeed3, 10, 10);
    xspeed4 = xspeed4 + m1*random(-2, 2);
    yspeed4 = yspeed4 + m2*random(-2, 2); 
    rect(mouseX+xspeed4, mouseY+yspeed4, 10, 10);
    fill(mouseX/random(4)-50, random(255)-50, mouseY/3-50); // medium rects
    xspeed = xspeed2 + m1*random(-4, 4);
    yspeed = yspeed2 + m2*random(-4, 4); 
    rect(mouseX+xspeed2, mouseY+yspeed2, 5, 5);
    xspeed2 = xspeed3 + m1*random(-4, 4);
    yspeed2 = yspeed3 + m2*random(-4, 4); 
    rect(mouseX+xspeed3, mouseY+yspeed3, 5, 5);
    xspeed3 = xspeed4 + m1*random(-4, 4);
    yspeed3 = yspeed4 + m2*random(-4, 4); 
    rect(mouseX+xspeed4, mouseY+yspeed4, 5, 5);
    xspeed4 = xspeed + m1*random(-4, 4);
    yspeed4 = yspeed + m2*random(-4, 4); 
    rect(mouseX+xspeed, mouseY+yspeed, 5, 5);
    fill(mouseX/random(4)-100, random(255)-80, mouseY/3-80); // small rects
    xspeed = xspeed2 + m1*random(-4, 4);
    yspeed = yspeed2 + m2*random(-4, 4); 
    rect(mouseX+xspeed, mouseY+yspeed, 2, 2);
    xspeed2 = xspeed3 + m1*random(-4, 4);
    yspeed2 = yspeed3 + m2*random(-4, 4); 
    rect(mouseX+xspeed2, mouseY+yspeed2, 2, 2);
    xspeed3 = xspeed4 + m1*random(-4, 4);
    yspeed3 = yspeed4 + m2*random(-4, 4); 
    rect(mouseX+xspeed3, mouseY+yspeed3, 2, 2);
    xspeed4 = xspeed + m1*random(-4, 4);
    yspeed4 = yspeed + m2*random(-4, 4); 
    rect(mouseX+xspeed4, mouseY+yspeed4, 2, 2);
    xspeed = xspeed4 + m1*random(-4, 4);
    yspeed = yspeed4 + m2*random(-4, 4); 
    rect(mouseX+xspeed3, mouseY+yspeed3, 2, 2);
    xspeed2 = xspeed2 + m1*random(-4, 4);
    yspeed2 = yspeed2 + m2*random(-4, 4); 
    rect(mouseX+xspeed, mouseY+yspeed, 2, 2);
    xspeed3 = xspeed + m1*random(-4, 4);
    yspeed3 = yspeed + m2*random(-4, 4); 
    rect(mouseX+xspeed4, mouseY+yspeed4, 2, 2);
    xspeed4 = xspeed3 + m1*random(-4, 4);
    yspeed4 = yspeed3 + m2*random(-4, 4); 
    rect(mouseX+xspeed2, mouseY+yspeed2, 2, 2);
  }
  if (!mousePressed ) {
    xspeed = 0;
    yspeed = 0;
    xspeed2 = 0;
    yspeed2 = 0;
    xspeed3 = 0;
    yspeed3 = 0;
    xspeed4 = 0;
    yspeed4 = 0;
  }

}

