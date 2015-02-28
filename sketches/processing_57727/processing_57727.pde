
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 15;

void setup(){
  size(700,450);
  smooth();
  background(35);
}

void draw() {
  noStroke();
  fill(100,100,100,100);
  rect(random(100),random(100),random(100),random(100));
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width) || (x < 0)) {xspeed = xspeed * -1;}
  if ((y > height) || (y < 0)) {yspeed = yspeed * -1;}
  fill(random(125),random(125),random(125),random(125));
 ellipse(x,y,50,50);
 ellipse(x,y,150,150);
 ellipse(x,y,255,255);
  ellipse(random(100),random(100),random(100),random(100));
}

 
