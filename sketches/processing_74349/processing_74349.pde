
int d = 35; 
int xPos= 0;
int yPos= 0;
int y = 200;
int x = 0;
int directionX = 0;
int lineDirectionX = 2;

float floatValue1 = 5;
float floatValue2 = 10;

void setup() {
 
  size(400, 400);
  smooth();
  noCursor();
  strokeWeight(5);
 
}

void draw () {
  background(255);
  
  line(x, 80, x, y + 50);
  x= x + lineDirectionX; 

  if(x > mouseX || x < 0){
    lineDirectionX = -lineDirectionX;
  }

  if (xPos > 400){
    directionX = -1;
  }
   if(xPos < 1){
    directionX = 1;
  }
 
  fill(255,255,0);

  ellipse(mouseX, mouseY, d, d);
  
}
