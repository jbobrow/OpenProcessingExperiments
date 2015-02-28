

color[] col = { 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)), 
  color( random(255), random(255), random(255)),
};

int [] arrayX = {
 int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),
int( random(0,400)),

};

int [] arrayY = {
  int(random(0,400)), 
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
  int(random(0,400)),
 
};

int [] arraySize = {
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  int(random (10, 100)), 
  
};


void setup()
{
  size (400, 400);
  background(0);
  rectMode(CORNER);
  ellipseMode(CENTER);
  noStroke();
  smooth();
}

void draw()
{
  
  int i = 0;
  while ( i < arrayX.length)
  {
    fill ( col[i], arrayY[i]);
    rect ( arrayX[i], arrayY[i], arraySize[i], arraySize[i]);
    pushStyle();
    noFill();
    stroke(col[i]);
    ellipse (arrayX[i], arrayY[i], arraySize [i], arraySize [i] );
    popStyle();
    i++;
  }
  //if (mousePressed) saveFrame("hw9.jpg");
  
}




