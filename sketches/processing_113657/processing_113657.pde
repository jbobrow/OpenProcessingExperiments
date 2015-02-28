
int rad= 60;
float xpos, ypos;
float xspeed= 2.3;
float yspeed= 2;
float xdirection=1;
float ydirection=1;
void setup() {
  size(500,500);
  frameRate(60);
  xpos = width/2;
  ypos = height/2;
  ellipseMode(RADIUS);
  background(0); 
}
void draw() {
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  fill(255);
  stroke(0);
    if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  ellipse(xpos, ypos, rad, rad);
}
