
int d = 40;
int xPos = 20;
int yPos = 20;
int directionX2 = 2;
int directionY2 = 2;
int directionX = 4;
int directionY = 4;

void setup() {
  size(400, 300);
  smooth();
  strokeWeight(3);
}

void draw() {
  
  if (keyPressed == true) {
    //ellipse
    fill(255);
    stroke(21, 6, 201);
    ellipse(xPos, yPos, d, d);
    xPos = xPos + directionX;
    yPos = yPos + directionY;
    //rectangle
    fill(77, 201, 6);
    stroke(201, 6, 6);
    rect(xPos, yPos, d, d);
    xPos = xPos + directionX;
    yPos = yPos + directionY;
  } else {
    //ellipse
    fill(255);
    stroke(21, 6, 201);
    ellipse(xPos, yPos, d, d);
    xPos = xPos + directionX2;
    yPos = yPos + directionY2;
    //rectangle
    fill(77, 201, 6);
    stroke(201, 6, 6);
    rect(xPos, yPos, d, d);
    xPos = xPos + directionX2;
    yPos = yPos + directionY2;
  }

  /*/right border
   if(xPos > mouseX - d/2) {
   directionX = - 1;
   }
   //left border
   if(xPos < d/2) {
   directionX = + 1;
   }
   //top border
   if(yPos < d/2) {
   directionY = + 1;
   }
   //bottom border
   if(yPos > mouseY - d/2) {
   directionY = - 1;
   }
   */

  //right border or left border
  if (xPos > width - d/2 || xPos < d/2) {
    directionX = directionX * -1;
  }

  //top border or bottom border
  if (yPos < d/2 || yPos > height - d/2) {
    directionY = directionY * -1;
  }
  
  //right border or left border
  if (xPos > width - d/2 || xPos < d/2) {
    directionX2 = directionX2 * -1;
  }

  //top border or bottom border
  if (yPos < d/2 || yPos > height - d/2) {
    directionY2 = directionY2 * -1;
  }
}
