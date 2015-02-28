
//  Title: Spiral Template
//  Description: A template for making an animated spiraling sketch 
//  Date Started: 2012 Feb 24
//  Last Modified: 2012 Mar 05
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.
//

//-----------------Globals
/* These are variables that you want to exist throughout the entire sketch.*/
float r = 250;
float rinc = -0.1;
float theta = 0;
float theta_vel = 0.01;
float vel_ratio = 1.0008;
//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
 the sketch size, background color, framerate, etc. etc.*/
void setup() {
  //setup the sketch parameters
  size(500, 500);
  frameRate(60);
  smooth();
}

//-----------------Main Loop
void draw() {
  //create a black background
  background(0);
  //convert the radius and angle of the circular path to x,y coordinates
  float x = r * cos(theta) + width/2;
  float y = r * sin(theta) + height/2;
  //setup the parameters for drawign the ellipse
  noStroke();
  fill(abs(sin(theta))*255, 0, abs(cos(theta))*255);
  //draw the ellipse
  ellipse(x, y, 16, 16);
  //update the position for the next frame
  if (rinc < 0) {
    theta_vel = theta_vel*vel_ratio;
    theta += theta_vel;
  } else {
    theta_vel = theta_vel/vel_ratio;
    theta += theta_vel;
  }
  r += rinc;
  if (r <= 15) {
    rinc = .2;
  } else if (r >= 250) {
    rinc = -.2;
  }
}

