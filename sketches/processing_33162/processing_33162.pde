
void setup() {
  size(500, 500);
}
 
float centerX = 50;
float centerY = 50;
float xspeed = random (10);
float yspeed = random (5);
 
 
void draw() {
  background(50, 300, 150);
   
  centerX = centerX + xspeed;
  centerY = centerY + yspeed;
 
  if (centerX > 550) {
    xspeed = xspeed * -2;
    fill(0, 50, 200);
  }
  else if (centerX < 50) {
    xspeed = xspeed * -2;
    fill (30, 255, 50);
  }
  else if (centerY > 550) {
    yspeed= yspeed *-2;
    fill (255, 30, 150);
  }
  else if (centerY < 50) {
    yspeed=yspeed * -2;
    fill (50, 60, 200);

  }
  noStroke();
  ellipse(centerX, centerY, 50, 50);
}


