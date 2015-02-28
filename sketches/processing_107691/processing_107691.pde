
int xspeed, yspeed;
int xpos, ypos, wdth, ht;
void setup(){
  size(400, 400);
  background(255);
  xspeed = 3;
  yspeed = 10;
  wdth = 10;
  ht = 10;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(60);
}
void draw(){
  background(255);
  fill(0);
  ellipse(xpos, ypos, wdth, ht);
  xpos += xspeed;
  ypos += yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2){
    xspeed *= -1;
  }
    if (ypos >= height-ht/2 || ypos <= ht/2){
    yspeed = yspeed * -1;
  }
}
/*
CHALLENGES FOR STUDENTS: MODIFY THE CODE TO DO THE FOLLOWING
  1. DOUBLE THE SIZE OF THE BALL
  2. MAKE THE CANVAS AS LARGE AS YOUR DISPLAY
  3. SET THE SPEED OF THE ANIMATION TO HALF
  4. MAKE THE BALL GO EXACTLY UP AND DOWN IN THE SAME X POSITION
  5. SHOW THE BALL PATH
  6. INVERSE THE COLOR OF THE BALL AND BACKGROUND
  7. STEP THROUGH THE ANIMATION WATCHING XPOS AND YPOS CHANGE
  8. MAKE ANOTHER SURFACE FOR THE BALL TO INTERACT WITH
  9. MAKE ANOTHER BALL
*/


