
//  Title: Spiral2
//  Description: A spirally sketch with
//  Date Started: 2012 Feb 24
//  Last Modified: 2012 Mar 11
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
float r_max = 150;
float r_vel=1;
float r = 0;
float theta = 0;
float theta_vel = 0.02;

//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
 the sketch size, background color, framerate, etc. etc.*/
void setup() {
  //setup the sketch parameters
  size(400, 400);
  frameRate(30);
  smooth();
  background(0,180);
}

//-----------------Main Loop
void draw() {
  //create a black background
  fill(0,25);
  rect(0,0,width,height);
  //convert the radius and angle of the circular path to x,y coordinates
  while (r < r_max){
    float x = r * cos(theta) + width/2;
    float y = r * sin(theta) + height/2;
    //setup the parameters for drawign the ellipse
    noStroke();
    fill(255);
    //draw the ellipse
    ellipse(x, y, 16, 16);
    fill(10);
    ellipse(y,x,16,16);
    //update the position for the next frame
    theta += theta_vel;
    r +=r_vel;
  }
  r = 0;
}

