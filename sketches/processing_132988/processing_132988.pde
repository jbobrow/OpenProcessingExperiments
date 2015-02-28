
int circleX = 0; //starting location of the circle
int circleDia = 50; //diameter of the circle
boolean goRight = true; //the circle starts by going right

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  
  ellipse(circleX, height/2, circleDia, circleDia);
  
  if(goRight) { //when going to the right increase the x value of the circle
  circleX++;
  }
  else { //when going to the left decrease the x value of the cirlce
  circleX--;
  }
  
  if(circleX >= width){ //when the circle gets to the right edge of the screen go Left
    goRight = false;
  }
  if(circleX <= 0) { //when the circle gets to the left edge of the screen go Right
    goRight = true;
  }
    
}


