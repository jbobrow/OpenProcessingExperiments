
int circleX = 200;
int circleY = 0;
int speedX = 2;
int speedY = 10;

void setup(){
  size(500, 200);
  frameRate (40);
}

void draw () {
  background (0);
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  fill (120, 160, 30 );
  ellipse (circleX, circleY, 80, 80);
  
  if (circleY > height) {
    //bouce up
    speedY=-speedY;
}
 if (circleY <= 0) {
   speedY=-speedY;
 }
  if (circleX > width) {
   speedX=-speedX;
 }

 if (circleX <= 0) {
   speedX=-speedX;
 }

if (circleY == height ) {
     fill (76, 25, 50 );
  ellipse (circleX, circleY, 40, 40);
  

}
}
