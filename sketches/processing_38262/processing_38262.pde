
//September 13 / while iteration
//Copyright Felipe Castelblanco, 2011

//move mouse in X to change dimension of circles
//move mouse in Y to change position of circles
//press any key to change background color and restart the animation

float dt;//diameter
float pos;//position


void setup () 
{
  size (400,400);
  dt = 10;
  pos = 0;
  
  smooth();
  
  ellipseMode(CORNER);
  randomSeed(100);
  
  strokeWeight(3);
  
  
}

void draw ()
{
  stroke(255);
  personalEllipse( pos + .5*width, pos + .5*height, dt-mouseX, pos-mouseY);
}

void personalEllipse(float x, float y, float dt, float pos)
{
  while(dt < 100 && pos < 200){
  dt = dt+5;
  pos = pos + 50;
  ellipse(pos, pos, dt+50, dt+50);
  fill(random (255), random (200), random (255));
  } 
}

void keyPressed ()
{
  
background (random(80,180));
  
}

