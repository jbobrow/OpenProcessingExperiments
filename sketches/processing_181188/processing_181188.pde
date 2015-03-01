
/*

Simple tweening: given current + ending state, calculate a tween.
Damping provides ease-out

*/

float currX, currY;  //where we are
float destX, destY;   //where we're going
float damping = .09; //how close to get 

void setup(){
  size(200,200);
  
  //some random variables, to start
  currX = random(width);
  currY = random(height);
  destX = random(width);
  destY = random(height);
  
  noStroke();  //no outline on the circles
 
}

void draw(){
  background(0); //fill the background with black

  fill(125);
  ellipse(destX, destY, 10, 10);  //draw the destination (grey)

  fill(255);
  ellipse(currX, currY, 10, 10);  //draw the ellipse at the current position
  
  
  currX += (destX - currX) * damping; //calculate a new x-value
  currY += (destY - currY) * damping; //calcuate a new y-value
  
  //if we're within 1 pixel of the destination, set a new destination
  if( currX >= destX - 1 && currX <= destX + 1 &&
      currY >= destY -1 && currY <= destY + 1){
    destX = random(width);
    destY = random(height);
  }
  
}



