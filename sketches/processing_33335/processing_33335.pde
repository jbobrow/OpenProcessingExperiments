
void setup() {
  size(500, 500);
}
 
float centerX = 50;
float centerY = 50;
float xspeed = random (10);
float yspeed = random (5);
 
 
void draw() {
  background(50, 300, 150);
  PImage b;
  b = loadImage("http://img41.imageshack.us/img41/2830/divingtigershark3jpgs1h.jpg");
  image(b, 0, 0);
   
  centerX = centerX + xspeed;
  centerY = centerY + yspeed;
 
  if (centerX > 250) {
    xspeed = xspeed * -1;
    fill(0, 50, 200);
  }
  else if (centerX < 50) {
    xspeed = xspeed * -1;
    fill (30, 255, 50);
  }
  else if (centerY > 250) {
    yspeed= yspeed *-1;
    fill (255, 30, 150);
  }
  else if (centerY < 50) {
    yspeed=yspeed * -1;
    fill (50, 60, 200);
  
  }  
  noStroke();
  ellipse(centerX, centerY, 50, 50);
}


