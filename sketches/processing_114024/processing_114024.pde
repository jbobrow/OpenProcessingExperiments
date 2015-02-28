
int rad1 = 10;
float xpos, ypos;

float xspeed =5; //speed of the ball side to side
float yspeed=1; //speed of the ball up and down 

int xdirection = 5; //direction of the ball side to side
int ydirection = 100; //direction of the ball side to side 

void setup()
{
size(1000, 400);
noStroke();
fill(1,240,10); //colour of the ball
frameRate(100);
ellipseMode(RADIUS);
// set the starting posistion of the shape
xpos= width/2;
ypos= height/2;
}

void draw()
{
  background(5);
  // update the position of shape
  xpos =xpos + (xspeed * xdirection );
  ypos =ypos + (yspeed * ydirection );
  // test to see if the shape exceeds the boundaries of the screen
  // if it does, reverse its dierction by multiplying by -1
  if (xpos > width-rad1 || xpos < rad1){
    xdirection *= -1;
  }
  if (ypos > height-rad1 || ypos < rad1){
  ydirection *= -1;
  }
  
   //draw the shape
   ellipse(xpos,ypos,rad1,rad1);
}


