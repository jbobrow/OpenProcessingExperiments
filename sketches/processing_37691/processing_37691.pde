
float x = 0;
float y = 0;
int myDiameter = 20;
float velocity = 10;




void setup()
{
  size(500, 500);
  frameRate(10);
  smooth();
  noStroke();
}


void draw()
{//background
  fill(0, 0, 0);
  rect(0, 0, width, height);
  //creates the rows for squares
for (int i=1; i<height; i = i+50) {
  ///fills the boxes with white and then fades the boxes out as the mouse moves to the right
    fill(255,255,255,width-mouseX);
    rect(x, (y+i), myDiameter,myDiameter);
    //fills the boxes with random color and then makes the boxes change shape
    fill(random(255),random(255),random(255),mouseX);
    rect(x, (y+i), myDiameter+(mouseX/random(1, 25)), myDiameter+(mouseX/random(1, 25)));
  }
//causes the boxes to bounce back to the left
  x = x+velocity;
  if (x>width-myDiameter)
  {
    velocity = -10;
  }
//makes the boxes move back to the right
  if (x<0) 
  {
    velocity = 10;
  }
}

