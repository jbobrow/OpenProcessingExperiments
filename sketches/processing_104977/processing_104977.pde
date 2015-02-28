
int BallHeights = 30;
int BallWidth= 30;
int x = 0;
int y = 0;
int speed = 5;
int wall=0;

void setup (){
  size(400, 400);
  smooth();
  
  noStroke();
  ellipseMode(CORNER);
  
}

void draw(){
  background (255);
  fill(255,0,0);
  ellipse(x,y,BallWidth, BallHeights);
  
  //x = x + speed;
  y = y + speed;
  
  if((y+BallWidth >= height)) {
    speed = speed *-1;
    wall+=20;
    }
    
    
    if(y<wall) {speed = speed *-1;
    wall+=20;
    y=wall;
    
    
    }
    }
