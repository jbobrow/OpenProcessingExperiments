
//Set variables for x and y coordinates of Circle 1 and Circle 2
//Make each of the variables have a +1 so they move across the screen

int xPos1;
int xPos2;
int yPos1;
int yPos2;

//make a variable about distance?
float distanceCircles;
float distanceWalls1;
float distanceWalls2;

//make a variable for velocity
int xVelocity1;
int yVelocity1;
int xVelocity2;
int yVelocity2;

void setup(){
  size(500, 500);
  smooth();
  xPos1 = width/2;
  xPos2 = width/4;
  yPos1 = height/5;
  yPos2 = height/3;
  //say what distance means
  distanceCircles = dist(xPos1, yPos1, xPos2, yPos2);
  xVelocity1 = 1;
  yVelocity1 = -1;
  xVelocity2 = 1;
  yVelocity2 = 1;
  //set size of screen
  //set colors of circles?
  //set distance from the walls
  distanceWalls1 = dist(xPos1, yPos1, width, height);
  distanceWalls2 = dist(xPos2, yPos2, width, height);
}

void draw(){
    //set background so it covers the last frame each time the ball moves
    background(255);
    //increase the position by 1 of each ball so they move
    distanceCircles = dist(xPos1, yPos1, xPos2, yPos2);
    distanceWalls1 = dist(xPos1, yPos1, width, height);
  distanceWalls2 = dist(xPos2, yPos2, width, height);
    //make condition so that when the balls touch EDGES (not 0 distance, but sum of both radii distances, which is 20 if the balls are 20 height/width), the direction changes
    if (distanceCircles <= 50){
      xVelocity1 = xVelocity1 *(-1);
      yVelocity1 = yVelocity1 *(-1);
      xVelocity2 = xVelocity2 *(-1);
      yVelocity2 = yVelocity2 *(-1);
      //make velocity be *-1 -- velocity += velocity * -1
    }
       xPos1 += xVelocity1;
    yPos1 += yVelocity1;
    xPos2 += xVelocity2;
    yPos2 += yVelocity2;
      //and an if if it hits the walls -- this would be the distance from radii of one circle, which is 10 if the width/height of a circle is 20
      if (xPos1 >= width- 40 || xPos1 <= 40){
        xVelocity1 = xVelocity1 *(-1);
      }
      if (yPos1 >= height- 40 || yPos1 <= 40){
      yVelocity1 = yVelocity1 *(-1);
      }
       if (xPos2 >= width- 10 || xPos2 <= 10){
       xVelocity2 = xVelocity2 *(-1);
      }
      if (yPos2 >= height- 10 || yPos2 <= 10){
      yVelocity2 = yVelocity2 *(-1);
      }
      //ELLIPSE 1 IS THE PINK BALL
      fill(252, 28, 201);
      ellipse(xPos1, yPos1, 80, 80);
      //ELLIPSE 2 IS THE YELLOW BALL
      fill(248, 252, 3);
      ellipse(xPos2, yPos2, 20, 20);
}

    
    //create If Else statement 
    //If the outside of one ball touches the outside of the other (distance), they reverse direction
      //Else, they continue moving in the same direction
  //set the velocity of the balls




