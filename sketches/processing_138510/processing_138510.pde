
// Beatriz Bukvic - March 5th, Creative Computing B, Benjamin Bacon

int radius = 30, directionX = 1, directionY = 0;
float x=300, y=300, speed=5;


void setup() {
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  
  fill(0,0,0,50);
  noStroke();
  background(255);
  
  x=x+speed*directionX;
  y=y+speed*directionY; 
  
  if ((x>width-radius) || (x<radius)) {   
    fill(17,80,232);
    directionX=-directionX;
  }
  
  if ((y>height-radius) || (y<radius))
  {   
    fill(17,80,232);
    directionY=-directionY;
  } 
  
  ellipse (x, y, radius, radius);
 
  }
  
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) { 
      directionX=-1;
      directionY=0;
    }
    
    else if (keyCode == RIGHT) {  
      directionX=1;
      directionY=0;
    }
    
    else if (keyCode == UP) {
      directionY=-1;
      directionX=0;
    }
    
    else if (keyCode == DOWN) {
      directionY=1;
      directionX=0;
    }
  }
}


