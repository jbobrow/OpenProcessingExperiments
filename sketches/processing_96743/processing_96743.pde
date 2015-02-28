
void setup() {
  /*
  Borrowed from the website "processing.org"
  */
  size(300,300);
  background(0,0);
  }

float x = 100;
float y = 100;
float xspeed = 7;
float yspeed = 6;


void draw() {
  noStroke();
  fill(255);
  rect(300,300,width,height);
  
  
  x = x + xspeed;
  y = y + yspeed;

   if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  
  stroke(#1CC929);
  fill(0,0,0);
  ellipse(x,y,2,2);
}


