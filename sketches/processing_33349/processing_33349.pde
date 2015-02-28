
//current location = old location + speed//

void setup() {
  size(600, 600);
}

float centerX = 50;
float centerY = 50;
float xspeed = random (10);
float yspeed = random (10);


void draw() {
  background(72, 209, 204);

  centerX = centerX + xspeed;
  centerY = centerY + yspeed;

  if (centerX > 550) {
    xspeed = xspeed * -1;
    fill(152, 251, 152);
  } 
  else if (centerX < 50) {
    xspeed = xspeed * -1;
    fill (255, 105, 180);
  } 
  else if (centerY > 550) {
    yspeed= yspeed *-1;
    fill (255, 0, 0);
  } 
  else if (centerY < 50) {
    yspeed=yspeed * -1;
    fill (255, 165, 0);
  }

  ellipse(centerX, centerY, 100, 100);
  ellipse(centerX+20, centerY+100, 30, 30);
  ellipse(centerX-20, centerY-100, 30, 30);
  ellipse(centerX+100, centerY-20, 30, 30);
  ellipse(centerX-100, centerY+20, 30, 30);
}

void mouseClicked() {
  fill (255, 215, 0);
  rect (centerX, centerY, 300, 300);
}

void mouseDragged() {
  fill(106, 90, 205);
}


