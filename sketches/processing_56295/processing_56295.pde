
//  Title: Moire Spiral
//  Description: Inspired by 'Spiral2' by Rachel Boyce
//  http://www.openprocessing.org/sketch/53137
//  Date Started: 2012 Mar 13
//  Last Modified: 2012 Mar 13
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

float r_max = 250;
float r_vel=1;
float r = 100;
float theta = 0;
float theta_vel = 0.005;

 
//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
 the sketch size, background color, framerate, etc. etc.*/
void setup() {
  //setup the sketch parameters
  size(550, 550);
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
    //fill(10);
    ellipse(y,x,16,16);
    //update the position for the next frame
    theta += theta_vel;
    r +=r_vel;
    text("Theta Velocity:",375,540);
    text(str(theta_vel),475,540);
  }
  r = 0;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      theta_vel += 0.001;
    }
    if (keyCode == DOWN) {
      theta_vel -= 0.001;
    }
  }
}

