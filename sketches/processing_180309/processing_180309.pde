





int NORTH = 5;
int NORTHEAST = 10; 
int EAST = 15;
int SOUTHEAST = 20;
int SOUTH = 25;
int SOUTHWEST = 30;
int WEST = 35;
int NORTHWEST= 40;

float stepSize = 10;
float diameter = 1;

int direction;
float posX, posY;
float trans;


void setup() {
  size(500, 500);
  background(254);
  smooth();
  noStroke();
  posX = random(100,400);
  posY = random(100,400);
}


void draw() {
  
  
 
  
    direction = (int) random(0, 45);

    if (direction == NORTH) {  
      posY -= stepSize;  
    } 
    else if (direction == NORTHEAST) {
      posX += stepSize;
      posY -= stepSize;
    } 
    else if (direction == EAST) {
      posX += stepSize;
    } 
    else if (direction == SOUTHEAST) {
      posX += stepSize;
      posY += stepSize;
    }
    else if (direction == SOUTH) {
      posY += stepSize;
    }
    else if (direction == SOUTHWEST) {
      posX -= stepSize;
      posY += stepSize;
    }
    else if (direction == WEST) {
      posX -= stepSize;
    }
    else if (direction == NORTHWEST) {
      posX -= stepSize;
      posY -= stepSize;
    }

   

    
    
    trans = 100;
    
   
    
    
    
    if (posX < 0){
  posX = 100;
  
  }
 if (posY < 0){
 posY = 400;
 
 } 
  
  if (posX == 400){
  posX = 100;
  
  }
 if (posY == 400){
 posY = 100;
 
 
 } 
     fill(255,255,255,1);
     rect(0,0,width,height);
     
   float a = posX+stepSize;
float b = posY+stepSize;
    fill(random(0,255),random(0,0),random(0,0),random(0,255)); 

    ellipse(a, b, 10, 10);
    
    fill(random(0,0),random(0,255),random(0,255),random(0,255));
     ellipse(b, a, 10, 10);
     

     
   
     
     
     println(posX,posY);
     
     
  }


