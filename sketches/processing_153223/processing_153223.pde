
/*
 * Creative Coding
 * Week 3, Foldout 02: Processing functions
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program illustrates the use of the Processing funcions:
 * sin, cos
 *
 * In this sketch the angle (in degrees) is equal to the current frame number,
 * so the functions cycle every 360 frames.
 *
 * See the foldout associated with this sketch for more details
 * 
 */

float ball_x, ball_y; // position of a ball on a circle
float center_x, center_y; // center of the circle
float radius; // radius of the circle

float blueFunction(float x) {
  //return pow(cos(x), onClick+counter()); // y increases going down so subtract
  //f=cos(x)*cos(x);
  float f=pow(cos(x),onClick+counter);
  return f; // y increases going down so subtract
} 
float redFunction(float x) {
  //return pow(sin(x), onClick+counter()); // y increases going down so subtract
  //return sin(x); // y increases going down so subtract
  f=pow(sin(x),onClick+counter);
  return f;
} 

int onClick=1;
void mouseClicked() {
  if (mouseButton==37) onClick++;
  if (mouseButton==39) onClick--;
}

void setup() {
  size(800, 300);
  center_x = 120;
  center_y = height/2;
  radius = 100;
}


void draw() {
  background(255);

  counter= floor(millis()/10000)%9;


  // calculate the angle in degrees based on the frame number
  float angleInDegrees = frameCount % 360;

  // now convert to radians using the radians function
  float angleInRadians = radians(angleInDegrees);

  // calculate the ball position around the circle
  ball_x = center_x + radius*blueFunction(angleInRadians);
  ball_y = center_y - radius*redFunction(angleInRadians); // use the - here because y goes from top to bottom

  // draw axes
  stroke(0, 30);
  line(0, center_y, width, center_y);
  line(center_x, 0, center_x, height);

  //circle
  noFill();
  stroke(0);
  ellipse(center_x, center_y, radius*2, radius*2);

  //line between center to rotating ball
  stroke(180);
  line(center_x, center_y, ball_x, ball_y);

  // draw cos component in x
  stroke(0, 0, 255);
  line(center_x, ball_y, ball_x, ball_y);

  // draw sin component in y
  stroke(255, 0, 0);
  line(ball_x, center_y, ball_x, ball_y);

  //rotating ball
  fill(255);
  stroke(0);
  ellipse(ball_x, ball_y, 10, 10);

  //centerPoint
  fill(0);
  ellipse(center_x, center_y, 5, 5);

  //plot the cos and sin curve to the right to the circle
  for (int x=0; x<360; x++) {
    // calculate the x position along the x axis
    float plotX = radians(x);

    // cos(x) is in blue
    stroke(0, 0, 255); 
    //point( 250 + x, height/2 - radius*cos(plotX) ); // y increases going down so subtract 
    point( 250 + x, height/2 - radius*blueFunction(plotX) ); // y increases going down so subtract 

    // sin(x) is in red
    stroke(255, 0, 0);
    point( 250 + x, height/2 - radius*redFunction(plotX) );
  }


  // angle is the current angle in radians
  float cos_ball_x = 250 + angleInDegrees;
  //float cos_ball_y = height/2 - radius*cos(angleInRadians);
  float cos_ball_y = height/2 - radius*blueFunction(angleInRadians);
  float sin_ball_x = 250 + angleInDegrees;
  float sin_ball_y = height/2 - radius*redFunction(angleInRadians);

  noStroke();

  // blue ball moves on the cosine curve
  fill(0, 0, 255);
  ellipse(cos_ball_x, cos_ball_y, 5, 5);

  // red ball moves on the sine curve
  fill(255, 0, 0);
  ellipse(sin_ball_x, sin_ball_y, 5, 5);

  // draw the bars showing the value for each function
  fill(0, 0, 255);
  rect(670, height/2, 30, -radius*blueFunction(angleInRadians) );

  fill(255, 0, 0);
  rect(635, height/2, 30, -radius*redFunction(angleInRadians) );
}



