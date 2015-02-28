
/*Max Benassi Animations sketch
 sept 22nd */
float theta;
float gravity;
float friction;
float ballRadius;
float velocity;  //xy vector
float xpos;
float ypos;
float speedx;
float speedy;
float damping;
float bcolor; 
float fillcol;

void setup() {
  size (900, 600);
  background (255);
  frameRate(30);
  xpos = 0;
  ypos = 600;
  ballRadius = random (10,30);
  gravity = .41;
  friction = .008;
  speedx = random(5,10);
  speedy = 21.5;
  damping = .80;
  bcolor = 359;
}





void draw () {
  //background redraw and color
  colorMode(HSB, 359, 99, 99);
  background (bcolor, 88, 93);

  //ball 1
  pushMatrix();
  translate (xpos, ypos);
  noStroke();
  fill(fillcol, 88, 93);
  ellipse(0, 0, ballRadius*2, ballRadius*2);
  popMatrix();

  //ball 2
  pushMatrix();
  translate (width - xpos, ypos);
  noStroke();
  fill(fillcol, 88, 93);
  ellipse(0, 0, ballRadius*2, ballRadius*2);
  popMatrix();

  //x axis movment
  xpos = xpos + speedx;
  speedx = speedx - friction;

  //background and ball color
  bcolor = ypos/1.67 ;
  fillcol = ypos;

  //y axis movment
  ypos -=  speedy;
  speedy -= gravity;


  //collisions and dampening/friction
  if (speedx < .5 && speedx > -.5) {
    speedx = 0;
  }

  if (xpos > width - ballRadius) { 
    xpos = width - ballRadius;
    speedx *= -1;
    friction *= -1;
  } 
  else if (xpos  < ballRadius) {
    xpos = ballRadius;
    speedx *= -1;
    friction *= -1;
  }


  if (ypos > 600 - ballRadius) {
    ypos = 600 - ballRadius;
    speedy *= -1;
    speedy *= damping;
  }
}


