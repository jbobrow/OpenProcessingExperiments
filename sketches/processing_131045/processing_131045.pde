
// tree
int TposX = 300;
int TposY = 590;
int TvelX = 2;
int TvelY = -2;

// branch 1
int B1posX = 317;
int B1posY = 580;
int B1velX = 1;
int B1velY = -1;

// branch 2
int B2posX = 303;
int B2posY = 560;
int B2velX = -1;
int B2velY = -1;

void setup () {
  size (600, 600);
  background (0);
  smooth ();
  noStroke ();
}

void draw () {
  fill (255);
  ellipse (TposX, TposY, 20, 20);
  
  TposX=TposX+TvelX;
  TposY=TposY+TvelY;
  
  if (TposX == 320) {
    TvelX=TvelX*-1; 
  }
  if (TposX == 280) {
    TvelX=TvelX*-1;
  }

//BRANCH1 
    fill (255);
    ellipse (B1posX, B1posY, 10, 10);

    B1posX=B1posX+B1velX;
    B1posY=B1posY+B1velY;
    
  if (B1posY == 530) {
    B1velY=B1velY*-1; 
  }
  if (B1posY == 590) {
    B1velY=B1velY*-1;
  }
  
//BRANCH2
  if (TposY == 500) {
    fill (255);
    ellipse (B2posX, B2posY, 10, 10);
  }
    B2posX=B2posX+B2velX;
    B2posY=B2posY+B2velY;
    
  if (B2posY == 500) {
    B2velY=B2velY*-1; 
  }
  if (B2posY == 561) {
    B2velY=B2velY*-1;
  }
}


