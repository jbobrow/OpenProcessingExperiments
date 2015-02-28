
float centerX = 40;
float centerY = 40;
float moveX = random (10,20);
float moveY = random (10,20);
 
void setup () {
  size (600,600);
  }
  
void draw () {
  background (0,255,255);
  stroke(250,100,255);
  strokeWeight(10);
  
  ellipse(centerX, centerY, 100, 100);
  centerX = centerX + moveX;
  centerY = centerY + moveY;
   
  if (centerX > 550) {
    moveX = moveX * -1;
    fill(70, 130, 180);
  }
  else if (centerX < 50) {
    moveX = moveX * -1;
    fill (106, 90, 205);   
  }
 if (centerY > 550) {
    moveY = moveY *-1;
    fill (25, 25, 112);
  }
  else if (centerY < 50) {
    moveY = moveY * -1;
    fill (176, 48, 96);
  } 
}
