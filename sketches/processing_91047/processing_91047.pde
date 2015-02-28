
class second_ {
float positionX;
float positionY;
float velocityX;
float velocityY;
float velocityX2;
float velocityY2;

second_ () { 
  positionX = random(100);
  positionY = random(100);
  velocityX = random(-10, 10);
  velocityY = random(-10, 10);
  velocityX2 = random(-10, 10);
  velocityY2 = random(-10, 10);
}

void move() {
  positionX=positionX+velocityX;
  positionY=positionY+velocityY;
}

void draw_() {  
  fill(random(3,650), random(3,650), random(3,650));
  noStroke();
  ellipse(positionX, positionY, 100, 100);
}
}

