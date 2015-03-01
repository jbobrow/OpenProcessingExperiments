
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
float[] dashY = new float[360];   //used to print a dashed line
void setup() {
  size(800, 300);
  center_x = 120;
  center_y = height/2;
  radius = 100;
  for (int i = 0; i< 360; i++) {
    dashY[i] = 0;
  }
}

void draw() {
  background(255);

  // calculate the angle in degrees based on the frame number
  float angleInDegrees = frameCount % 360;
  // now convert to radians using the radians function
  float angleInRadians = radians(angleInDegrees);

  // calculate the ball position around the circle
  ball_x = center_x + radius*cos(angleInRadians);
  ball_y = center_y - radius*sin(angleInRadians); // use the - here because y goes from top to bottom

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

  //plot the cos and sin curve to the right of the circle
  for (int x=0; x<360; x++) {    // calculate the x position along the x axis
    float radX = radians(x);  //radx is the angle in radians at each point along x
    float sinValueY = height/2 - radius*sin(radX);
    float cosValueY = height/2 - radius*cos(radX);

    dashY[x] =  lerp(cosValueY, sinValueY, 0.5) ;  //create the array used to make the dashes

// cox(x) in blue;
    stroke(0, 0, 255);
    point( 250 + x, cosValueY ); // y increases going down so subtract

    // sin(x) in red
    stroke(255, 0, 0);
    point( 250 + x, sinValueY ); // y increases going down so subtract
  }  //end of inner for loop

  // angle is the current angle in radians
  float graph_ball_x = 250 + angleInDegrees;  //angleInDegrees is a counter from 0 to 359
  float cos_ball_y = height/2 - radius*cos(angleInRadians);
  float sin_ball_y = height/2 - radius*sin(angleInRadians);
  noStroke();

  // blue ball moves on the cosine curve
  fill(0, 0, 255);
  ellipse(graph_ball_x, cos_ball_y, 5, 5);

  // red ball moves on the sine curve
  fill(255, 0, 0);
  ellipse(graph_ball_x, sin_ball_y, 5, 5);

  // purple ball moves on the dashed curve
  fill(200, 0, 200);
  ellipse(graph_ball_x, dashY[(int) angleInDegrees], 5, 5);

  // draw the bars showing the value for each function
  fill(0, 0, 255);
  rect(670, height/2, 30, -radius*cos(angleInRadians) );

  fill(255, 0, 0);
  rect(635, height/2, 30, -radius*sin(angleInRadians) );

  fill(200, 0, 200);
  rect(705, height/2, 30, -radius*lerp(cos(angleInRadians),sin(angleInRadians),0.5));

  stroke(200, 0, 200);  //dark purple colour
  for (int i=0; i < 51; i++) {
    point(255 + 7*i, dashY[7*i + 5]);
    line( 250 +7*i, dashY[7*i], 253 + 7*i, dashY[7*i+3] );
  }
}  // end of draw



