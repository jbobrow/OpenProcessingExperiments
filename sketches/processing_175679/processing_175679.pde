
float circleX = 0;
float circleY = 0;
 
//moving factors
//Random. Each time you load the sketch, the ellipse moves differently.
float moveX = random(1, 8);
float moveY = random(1, 8);



void setup() {
  size(500, 500);
  smooth();
  stroke(#009BFF);
}
 
void draw() {
  if (mouseX < width/3) {
  background (#F247D6); 
  moveX = moveX+.5;
  
} else if (mouseX < 2*width/3) {
   moveX = moveX+1;
    
} else {
  background (#38D8F2); 
    moveX = moveX+3;
}
  

  //ellipse color
  fill(255);
   
  //Draws ellipse with parameters and random for wobbly effect
  ellipse(circleX + random(2, 9), circleY + random(2, 9), 40, 40);
   
  //moving factors
  circleX = circleX + moveX;
  circleY = circleY + moveY;
   
  //right
  if(circleX > width) {
    moveX = -moveX;
  }
     //left 
  if(circleX < 0) {
    moveX = -moveX;
  }
   
  //top
  if(circleY < 0) {
    moveY = -moveY;
  }
   
  //bottom
  if(circleY > height) {
    moveY = -moveY;
  } 
}

