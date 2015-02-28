
float x;
float y;
float yspeed = 0;
float xspeed = 0;
float balldiameter = 10;
float ballradius = balldiameter/2;
 
void setup() {
  size (400,400);
  background (255);
  fill (0);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  x = width/2;
  y = height/2;
}
 
void draw() {
  mouseChecks();
  boundaryChecks();
  ballFunctions();
 
}
 
void mouseChecks() {
  if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
    yspeed = mouseY - pmouseY;
    xspeed = mouseX - pmouseX;
  }
}
 
void boundaryChecks() {
  if (y >= height - ballradius) {
    y = height - ballradius;
    yspeed = -yspeed/1.15;
  }
  if (y <= ballradius) {
    y = ballradius;
    yspeed = -yspeed/1.35;
  }
  if (x >= width -ballradius) {
    x = width -ballradius;
    xspeed = -xspeed/1.10;
  }
  if (x <= ballradius) {
    x = ballradius;
    xspeed = -xspeed/1.10;
  }
}
 
void ballFunctions() {
  if (balldiameter < 2) {
    balldiameter = 2;
  }
  if (balldiameter > 400) {
    balldiameter = 400;
  }
  ballradius = balldiameter/2;
  background(0); 
  fill (255);
  ellipse (x,y,balldiameter,balldiameter);
  yspeed = yspeed += 0.2;
  xspeed = xspeed/1.005;
  y = y + yspeed;
  x = x + xspeed;
  {
  int x = 7;
  
  while (x < 3000)
  {
    int y = 7;
    
    while (y < 300)
    {     
      ellipse(x, y, 10, 10); 
      y = y + 30;
    }
    x = x + 30;
  }

}
}


