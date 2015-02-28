
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;



void setup() {
  size(200,200);
  smooth();
  background(255,10);
}

void draw() {
  noStroke();
  fill(60);
  rect(0,0,width,height);
 
  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
}




