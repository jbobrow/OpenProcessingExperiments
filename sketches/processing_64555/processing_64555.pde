
/*
Planar Robotic Arm Visualizer
 
 by Dustyn Roberts 20120622
 */

//constants 
float a1 = 198; // shoulder-to-elbow "bone" length from Solidworks (mm)
float a2 = 220; // elbow-to-wrist "bone" length from Solidworks (mm) - longer c bracket

boolean elbowup = false; // true=elbow up, false=elbow down

int Xoffset = 425;
int Yoffset = 425;

//variables
float theta1 = 0.0; // target angles as determined through inverse kinematics
float theta2 = 0.0;

float c2 = 0.0; // is btwn -1 and 1
float s2 = 0.0;

float joint1X;
float joint1Y;

float joint2X;
float joint2Y;

void setup() {

  size(850, 650, P3D);
  background(157, 6, 50);
}

void draw() {
  background(123, 82, 171);
  strokeWeight(4);
  
  rotateX(PI); // make the y axis point up 
  translate(Xoffset, -Yoffset); // lower down the arm and move it to the middle so we can see it

  // figure out the joint angles needed to get to mouseX, mouseY position
  get_angles(mouseX-Xoffset, -mouseY+Yoffset);  
  //figure out the joint coordinates of joint1 to draw link 1
  get_xy();
  line(0.0, 0.0, joint1X, joint1Y);
  line(joint1X, joint1Y, joint2X, joint2Y);
  
  // print out the x and y values of the end effector
  print(mouseX-Xoffset);
  print(',');
  println(-mouseY+Yoffset);
}

// Given target(Px, Py) solve for theta1, theta2 (inverse kinematics)
void get_angles(float Px, float Py) {
  // first find theta2 where c2 = cos(theta2) and s2 = sin(theta2)
  c2 = (pow(Px, 2) + pow(Py, 2) - pow(a1, 2) - pow(a2, 2))/(2*a1*a2); // is btwn -1 and 1

  if (elbowup == false) {
    s2 = sqrt(1 - pow(c2, 2)); // sqrt can be + or -, and each corresponds to a different orientation
  }
  else if (elbowup == true) {
    s2 = -sqrt(1 - pow(c2, 2));
  }
  theta2 = degrees(atan2(s2, c2)); // solves for the angle in degrees and places in correct quadrant

  // now find theta1 where c1 = cos(theta1) and s1 = sin(theta1)
  theta1 = degrees(atan2(-a2*s2*Px + (a1 + a2*c2)*Py, (a1 + a2*c2)*Px + a2*s2*Py));
}

void get_xy() {
  joint1X = a1*cos(radians(theta1));
  joint1Y = a1*sin(radians(theta1));

  joint2X = a1*cos(radians(theta1)) + a2*cos(radians(theta1+theta2));
  joint2Y = a1*sin(radians(theta1)) + a2*sin(radians(theta1+theta2));
}


