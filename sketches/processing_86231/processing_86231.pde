
// INSTANCE VARIABLES
float speed = 3;
float directionX = 1, directionY = 1;
float x = 50, y = 150;
float ballDiameter = 50;
float ballRadius = ( ballDiameter / 2) ;

float incrementX = 1, incrementY = 1, time, distance;
float speedFactor;

void setup() {
 size(500,500);
}

void draw() {
  fill(0);
  background(255);
  ballGoCoordinates();
  moveBallWithMouse(3);
  bounceBall(); 
  displayBall();
  displayHamster();
} 


void displayHamster() {
  fill(150,30,12);
  ellipse(mouseX, mouseY, 10, 10);

}
void ballGoCoordinates() {
   distance = dist(x, y, mouseX, mouseY);
   time = distance / speed;
   incrementX = ( (mouseX - x) / time );
   incrementY = ( (mouseY - y) / time );
}

void moveBallWithMouse(float speedFactor) {
  this.speedFactor = speedFactor;
  x += (incrementX * speedFactor );
  y += (incrementY * speedFactor );
}


void displayBall() {
  ellipse(x, y, ballDiameter, ballDiameter);
}


void  bounceBall() {
  // Check if Ball Bounces from Top and Down of Frame Window.  
  if ( x < ballRadius || x > width - ballRadius ) {
    if ( x > width - ballRadius ) { 
      x = width - ballRadius ;
    } else {
      x = ballRadius;
    } 
    directionX *= -1;
  }

  // Check if Ball Bounces from Top and Down of Frame Window.
  if ( y < ballRadius || y > height - ballRadius) {
     if ( y >= height - ballRadius) { 
        y = height - ballRadius;
    } else {
        y = ballRadius;
    } 

    directionY *= -1;
  }
  
}






