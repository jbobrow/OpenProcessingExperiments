
float circlex; //<>//
float circleY;
float directionX; 
float speedX;
float directionY; 
float speedY;

float colorR;
float colorG;
float colorB;

float paddleX;
float paddleY;
float paddleheight;

boolean start;


void setup() {
  size(800, 600);
  circleY = height/2;
  circlex = width/2;
  start = false;
  directionX = 1;
  speedX = 4;
  directionY = 1;
  speedY = 4;
  paddleX = 10;
  paddleheight = 80;
 
  // starting circle color
  colorR = 10;
  colorG = 50;
  colorB = 200;
}

void mousePressed() {

  // iff you press the mouse then start will the always true
  start = true;
  circleY = height/2;
  circlex = width/2;
}

void draw() {

  circleY = circleY + speedY * directionY; // move the ball add the speed and multiply by its direction
  circlex = circlex + speedX * directionX; // move the ball add the speed and multiply by its direction

  background(0);

  //------------------------------------ball------------------------------------------------------------------------------------------------------------------------------

  // if start is true then daraw the ellipse.
  if (start == true) { 
    fill(colorR,colorB,colorG);// each color has a variable, so we can change ir when it hit the paddle.
    ellipse(circlex, circleY, 18, 18);
  }


  // if it hit the left or right it goes other way.

  if ( circlex >= width ) { // left side doent make the ball kick, that swhy its oly checking the ball position ond the right side.  
    directionX = directionX * -1 ; // if its negative it becomes positive, and if its positive it becomes negative -- (5) * -1 = (-5) -- (-5) * -1 = (5)
  }


  //if it hits top or botton it goes the other way.

  if ( circleY >= height || circleY <= 0 ) {
    directionY = directionY * -1 ; // if its negative it becomes positive, and if its positive it becomes negative -- (5) * -1 = (-5) -- (-5) * -1 = (5)
  }

  //------------------------------Paddles------------------------------------------------------------------------------------------------------------------------------------


  paddleY = mouseY; // its in draw loop so it will always be at the mouse position

  fill(255);
  rectMode(CENTER); // set x ans y position on the center of the object
  rect(paddleX, paddleY, 10, paddleheight);


  rectMode(CENTER); // set x ans y position on the center of the object
//  fill(255, 255, 255, 40);
noFill();
  rect(paddleX, paddleY, 10000, 80);


  //------------------ball hitting the padlle--------------------------------------------------------------------------------------------------------------------------

  // DEFINING the overlaped area: if the circle is bellow (mouseY - half of the paddle.) AND if its above (mouseY + half paddle).
  // if the circle x position is behind (<= 0) the paddle AND if the Y position is equal to the paddle area at the same time, the ball will bounce!


  if (circleY >= mouseY - paddleheight/2 && circleY <= mouseY + paddleheight/2 && circlex <= 10) {

    directionX = directionX * -1; // chnge the X direction
    
    // changing all the 3 values of the circle color randomly between 0 and 255.
    colorR = random(0,255);
    colorB = random(0,255); 
    colorG = random(0,255); 
}
//
//  println(start);
}


