
float centerX = 50;
float centerY = 50;
float xspeed = random (10);
float yspeed = random (10);

void setup () {
  size (600,600);
  }
 
 
void draw () {
  
  background (255,255,255);
  
  
  ellipse(centerX, centerY, 100, 100);
  
  centerX = centerX + xspeed;
  centerY = centerY + yspeed;
  
  if (centerX > 550) {
    xspeed = xspeed * -1;
    fill(70, 130, 180);
  }
  else if (centerX < 50) {
    xspeed = xspeed * -1;
    fill (106, 90, 205);	
  }
 if (centerY > 550) {
    yspeed= yspeed *-1;
    fill (25, 25, 112);
  }
  else if (centerY < 50) {
    yspeed=yspeed * -1;
    fill (176, 48, 96);
  }
  
 


   
}

