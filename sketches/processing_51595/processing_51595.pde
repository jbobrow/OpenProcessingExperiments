
/*****************************************
 * Assignment 02
 * Name:         Zhen Xu
 * E-mail:       zxu01@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    Feb. 7th
 * 
 * An aera is in war so that the government can only transport the daily stuff 
 * by parachute. Click the sky area to see parachute, click the ground area to 
 * see the packages delivered.
 ***********************************************/ 


// Declare variables
float horizon = 300;
void setup() {
  // Set up the drawing.
  size(600, 600);
  // Draw the sky 
  fill(71, 159, 250);
  rect(0, 0, width, horizon);
  //gate
  fill(255);
  rect(0, 0, 50, horizon);
  rect(550, 0, 50, horizon);
  rect(50, 0, 500, 50);
  //ground
  fill(147, 103, 37);
  rect(0, height/2, width, horizon);
  //flower on the gate
  flower(300, 25, int(random(10, 50)));
}
void flower(int centerX, int centerY, int n) {
  int size = int(random(15, 30));    
  float angle = 2*PI/n;  
  for (int i=0; i<n; i++) {
    fill(random(200, 255), random(100, 150), random(200, 255), 50);
    ellipse(centerX+size*cos(angle*i), centerY+size*sin(angle*i), size, size);
  }
}
void draw() { 
  /* remains empty */
}
void mousePressed() {
  // Use the mouseY position to decide whether drawing on sky or on ground
  if (mouseY<width/2) {
    float scal=(horizon-mouseY)/mouseY;
    drawParachute(mouseX, mouseY, scal);
  }
  else {
    float scal = (mouseY-horizon)/horizon;
    drawPackage(mouseX, mouseY, scal);
  } 
}
//draw parachute
void drawParachute( int x, int y, float scal ) {
  smooth();
  fill(196, 87, 227);
  ellipse(x, y, 30*scal, 30*scal);
  line(x-15*scal, y, x, y+50*scal);
  line(x+15*scal, y, x, y+50*scal);
  fill(247, 250, 56);
  rectMode(CENTER);
  rect(x, y+50*scal, 15*scal, 15*scal);
}
//draw package
void drawPackage ( int x, int y, float scal ) {
fill(40,227,250);
rect(x, y, 40*scal, 40*scal);
fill(255);
rectMode(CENTER);
rect(x,y,40*scal,20*scal);
rect(x,y,20*scal,40*scal);

}


