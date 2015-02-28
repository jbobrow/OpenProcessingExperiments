
float circleX; //float for the x pos of the circle
float circleY; //float for the y pos of the circle
float xVel; //float for the movement along the horizontal plane
float yVel; //float for the movement along the vertical plane
int rad1; //radius for ellipse

float circle2X; //float for the x pos of the circle
float circle2Y; //float for the y pos of the circle
float x2Vel; //float for the movement along the horizontal plane
float y2Vel; //float for the movement along the vertical plane
int rad2; //radius for ellipse

float gravity; //gravity!

void setup(){
  size(500, 500);
  smooth();
  circleX = width/2-40; //starting at x pos of our circle
  circleY = height/2+60; //starting at y pos of our circle
  //we'll start the circle going to the right by using positive numbers
  xVel = 6; //higher number == faster movement (horizontal)
  yVel = 4; //higher number == faster movement (vertical)
  gravity = 0.3; //we'll set gravity to 0.3. We don't ever want this to be a negative --
  //gravity is ALWAYS pulling us toward the bottom of the sketch -- down the y-axis
  circle2X = width/2-60; //starting at x pos of our circle
  circle2Y = height/2+80; //starting at y pos of our circle
  //we'll start the circle going to the right by using positive numbers
  x2Vel = 6; //higher number == faster movement (horizontal)
  y2Vel = 4; //higher number == faster movement (vertical)
  
  rad1 = 30;
  rad2 = 30;
}
void draw(){
  println("yVel = "+ yVel + " y2Vel = "+ y2Vel);  
  background(0);
  noStroke();
  ellipseMode(RADIUS);
  yVel += gravity; //add gravity to the y velocity
  y2Vel += gravity; //add gravity to the y velocity
  //if the velocity is positive it makes it bigger
  //if it's negative it makes it smaller
  circleX += xVel; //we increment the circle x position by the x velocity
  circleY += yVel;//same with the y pos and y vel
  
  circle2X += x2Vel; //we increment the circle x position by the x velocity
  circle2Y += y2Vel;//same with the y pos and y vel
  
  if((circleX > width) || (circleX < 0)){
    xVel *= (-1);
  }
  if((circleY > height) || (circleY < 0)){
    yVel *= (-1);
    xVel *= (0.85);
  }
  if(circleY > height){
    circleY = height;
  }
  
  if((circle2X > width) || (circle2X < 0)){
    x2Vel *= (-1);
  }
  if((circle2Y > height) || (circle2Y < 0)){
    y2Vel *= (-1);
    x2Vel *= (0.85);
  }
  if(circle2Y > height){
    circle2Y = height;
  }
  
  if(dist(circleX, circleY, circle2X, circle2Y) <= 45){
    if(((x2Vel > 0) && (xVel < 0)) || ((x2Vel < 0) && (xVel > 0))){
    xVel *= (-1);
    x2Vel *= (-1);
    }
    if(((y2Vel > 0) && (yVel < 0)) || ((y2Vel < 0) && (yVel > 0))){
    yVel *= (-1);
    y2Vel *= (-1);
    }
  }
  
  fill(255, 0, 255);//pink ball
  ellipse(circleX, circleY, rad1, rad1);
  fill(255, 255, 0);//yellow ball
  ellipse(circle2X, circle2Y, rad2, rad2);
}

