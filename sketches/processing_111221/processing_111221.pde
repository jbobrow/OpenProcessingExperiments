
float speedX=4;
float speedY=3;
float  diameter=50;
float distanceX= random(0, 555);
float distanceY=diameter/2;

int paddlewidth = 100;
int paddleheight = 30;

int directionX = 1;
int directionY = 1;

float speedA=4;
float speedB=3;
//float  diameter=50;
float distanceA= diameter/2;
float distanceB=random(0, 555);

int directionA = 1;
int directionB = 1;

void setup() {
  size( 555, 555);
  background( 50, 65, 75);
  fill (50, 65, 75);
}

void draw () {
  //fill (50, 0);
  fill (50, 65, 75, 33);
  rectMode(CORNER);
  rect(0, 0, width, height);
  //background( 50, 65, 75);
  noStroke();
  fill (random(100, 190), random(100, 200), random(155, 255), 55);
  ellipse (distanceX, distanceY, diameter, diameter);
  distanceX += speedX*directionX;
  distanceY += speedY*directionY;

  fill (100, 99, 77, 100);
  rectMode(CENTER);
  rect(mouseX, mouseY, paddlewidth, paddleheight);

  if (distanceX > height -diameter/2) 
  { 
    directionX = -1;
  }

  else if (distanceX <0 + diameter/2) {
    directionX = 1;
  }

  if (distanceY > width -diameter/2) 
  { 
    directionY = -1;
  }

  else if (distanceY <0 + diameter/2) {
    directionY = 1;
  }

//if (distanceX == mouseX - .5*paddlewidth);

  if ((distanceY >= mouseY- .5*paddlewidth) && (distanceX <= mouseY + .5*paddlewidth)) {
    println(distanceY);
    
      //directionY = -1 ;
    directionY= -1;
    println(directionX);
  }  

//  if ((distanceX >= mouseX - .5*paddlewidth) && (distanceX <= mouseX + .5*paddlewidth)) {
//    if ((distanceY >= mouseY - .5*paddleheight) && (distanceY <= mouseY + .5*paddleheight))  //paddle bounce
//    {
//      directionY = -1 ;
//    }
//    directionX= -1;
//  }  
}

  //paddle bouncehttp: //drdoane.com/thinking-through-a-basic-pong-game-in-processing/


  // == does it equal

  // ++ will dosomething if to things are true

  //  ||

  //  &&
