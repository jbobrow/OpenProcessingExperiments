
/* jack Hale

It's Alive !!!
make a circle that "breathes" using variable and for loops/
*/
int yPos = 1;
int xPos = 1;
int xCount = 5;
int yCount = 2;
void setup(){
  frameRate(9999999);
  size(600,600);
  smooth();
  
}

void draw(){
 
    noFill();
    stroke(87,255,5);
    strokeWeight(20);
    ellipse(xPos,yPos,10,10);
    xPos = xPos + xCount; // index x position by 1
    if(xPos >= 600 || xPos <= 0){
      xCount = -xCount; //reverse whe you hit the x edge
    }
  yPos = yPos + round(yCount*1.2); // index x position by 1
 if(yPos >= 600 || yPos <= 0){
      yCount = -yCount; //reverse whe you hit the far edge
 }
}
