
float x = 100; //starting positions
float y = 300;

float speedX = 2;
float speedY = 2;
float gravTimer = 1;

void setup() {
  size(500,500);
  smooth();
}

void draw() {

  background(255); //reset bg
  x = x + speedX; //move it right by 2 each frame if speedX is positive or left by 2 if it is negative
  y = y + speedY; //move it down by 2 each frame if speedY is positive or up by 2 if it is negative

  if ((x > width) || (x < 0)) {  //horizontal ball boundary
    speedX = speedX * -1; //X reversal
  }

  if ((y > height) || (y < 0)) { //vertical ball boundary
   speedY = speedY * -1;// * gravTimer; //Y reversal
  } 
  

  strokeWeight(3);
  fill(255,0,0);
  ellipse(x,y,40,40);
  fill(255);
  strokeWeight(1);
  ellipse(x-5,y-5,5,7);
}

