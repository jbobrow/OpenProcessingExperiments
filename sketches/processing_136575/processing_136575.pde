
//mouseOver Circle  note:  only works with ellipses where 
//width and height are the same . . . a circle
//a few variables we can store values in

int xPos, yPos;  //x and y coordinates of the cursor
int xCircle, yCircle; //x and y coordinates of the ellipse/circle
int radius; //half the width or height

void setup() {
  size(500, 500);
  smooth(8); //a really high level of smoothing . . .
}

void draw() {
  ellipse(250, 250, 200, 200); //draw an ellispse in the center of the render window
  if(onCircle(mouseX, mouseY, 250, 250, 200) == true) { //use the onCircle() function to check if cursor is over ellipse
    fill(0); // if so fill with black
  }
  else{
    fill(255); //else, fill with white
  }
}


//The function below returns a boolean value or true, if on the circle, and false is off the circle
//We can est the function in the main draw() function
boolean onCircle(int xPos, int yPos, int xCircle, int yCircle, int circleWidth){
  if(dist(xPos, yPos, xCircle, yCircle) <= circleWidth/2) {
    return true;
  }
  else {
    return false;
  }
}
  


