
int d = 60;
int xPos = 0;
int yPos = 0;

int directionX = 1;
int directionY = 1;

void setup() {
  size (400, 300);
  smooth ();
}

void draw () {
  background (255);
  
  //pesce palla
  noStroke ();
  ellipse (xPos, yPos, d, d);
    fill (0);
    
    
  
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
  //right
  if(xPos > width -d/2){
    directionX = -1;
   
  }
  //bottom
  if(yPos > height- d/2){
    directionY = -1;
  }
     
  //left
  if(xPos < d/2){
    directionX = 1;
  }
  
  //top
  if(yPos < d/2){
    directionY = 1;
  }
 
 if (mousePressed){
 d=d+5;
 fill (127, 212, 252);
 
 } else{
 fill (255, 113, 116);
 
 }

if (d== height){
d=60;
}
}
