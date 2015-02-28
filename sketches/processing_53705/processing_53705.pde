
/************************************************************
*
* Assignment #4
* Kelli Breeden
* kbreeden@brynmawr.edu
* CS 110 - Section 2
* Submitted 2/28/2012
*
* this sketch depicts a winter night scene. A house and snowman
* sit on a snowy hill. When one clicks anywhere on the screen,
* a snowflake appears and drifts down to the ground. This created
* by an array. When these snowflakes reach the bottom or right
* most edge of the screen, they reappear at the top of the
* window.
*
************************************************************/
int maxFlakes = 60; 
Snowflake [] snowflakes = new Snowflake[maxFlakes];
int idxSnowflakes = 0;
 
void setup () {
  size (800,600);
}

 
void draw() {
 
  background (0, 0, 90);
  smooth();
  noStroke();
 
  //ground
  fill(200);
  ellipse(400,550,1100,300);
  house();
 
  // causes the snowflakes to fall
  for (int j=0; j<snowflakes.length; j++) {
    if (snowflakes[j] != null) {
      snowflakes[j].step();
    }
    else {
      continue;
    }
  }
}
 
void mousePressed() {
  //creates a new snowflake where mouse is clicked
  snowflakes[idxSnowflakes] = new Snowflake();
  snowflakes[idxSnowflakes].draw();
  idxSnowflakes = (idxSnowflakes+1) % maxFlakes;
}

void house(){
  fill(163,0,82);
  rect(45,320,180,125);
  fill(102,51,0);
  rect(70,270,35,50); //chimney
  triangle(35,320,235,320,140,270); //roof
  rect(124,390,40,55); //door
  //windows
  fill(0);
  rect(68,365,35,35);
  rect(180,365,35,35);
  
  //to draw a snowman
  fill(255);
  ellipse(400,400,50,50);
  ellipse(400,370,40,40); //body
  ellipse(400,345,30,30);
  stroke(0);
  point(395,343); //face
  point(405,343);
  fill(255,102,0);
  triangle(400,344,400,348,405,346);
  line(380,370,350,360); //arms
  line(420,370,450,360);
}

