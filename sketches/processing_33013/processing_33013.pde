
//current location = old location + speed//

void setup() {
  size(600, 600);
}

float centerX = 50;
float centerY = 50;
float xspeed = random (10);
float yspeed = random (5);


void draw() {
  background(255, 255, 255);
  
  centerX = centerX + xspeed;
  centerY = centerY + yspeed;

  if (centerX > 550) {
    xspeed = xspeed * -1;
    fill(0, 0, 0);
  } 
  else if (centerX < 50) {
    xspeed = xspeed * -1;
    fill (0, 255, 0);
  } 
  else if (centerY > 550) {
    yspeed= yspeed *-1;
    fill (255, 0, 0);
  } 
  else if (centerY < 50) {
    yspeed=yspeed * -1;
    fill (0, 0, 255);
  }

  ellipse(centerX, centerY, 100, 100);
}




