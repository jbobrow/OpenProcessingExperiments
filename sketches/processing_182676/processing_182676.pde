
/* Exercise 4
Suzanne Boretz
This program makes a clickable drawing program. 
*/

int ellipseW = 15;
float currentX; 
float currentY;
float savedX; 
float savedY;
float originalX;
float originalY;
int x = 1;
float dampen = 0.015;
float endLineX;
float endLineY;
float col;
float col2;
float col3;

void setup() {
  frameRate(700);
  size(500,500); 
  background(43, 54, 94);
  originalX = random(ellipseW, width - ellipseW); //sets the starting point to a random point
  originalY = random(ellipseW, height - ellipseW);
  savedX = currentX = originalX; //all the variables are equal to start
  savedY = currentY = originalY;
  col = random(50, 200); //color values are assigned randomly
  col2 = random(50, 200);
  col3 = random(0, 100);
}

void draw(){
  //if the mouse is hovering over the current or original ellipse, the ellipses change color
 if(mouseX >= currentX - ellipseW/2 && mouseX <= currentX + ellipseW/2 &&
     mouseY >= currentY - ellipseW/2 && mouseY <= currentY + ellipseW/2 
     ||
     mouseX >= originalX - ellipseW/2 && mouseX <= originalX + ellipseW/2 &&
     mouseY >= originalY - ellipseW/2 && mouseY <= originalY + ellipseW/2){
       fill (col3, col, col2);
     } else fill(255); 

    noStroke();
    ellipse(originalX, originalY, ellipseW, ellipseW); //draws the original point
    ellipse(currentX, currentY, ellipseW, ellipseW); //draws the random next point
  
  //if the value of the saved ellipse is not equal to the value of the current ellipse,
  // we draw a line from one ellipse to the other
  if (savedX != currentX && savedY != currentY) {
    savedX = savedX + (currentX - savedX) * dampen;
    savedY = savedY + (currentY - savedY) * dampen;
    endLineX = savedX + (currentX - savedX) * dampen;
    endLineY = savedY + (currentY - savedY) * dampen;
    fill(255, 246, 125);
    ellipse(endLineX, endLineY, 2, 2); 
    fill(0);
  }
}

void mouseClicked(){
  
  //if the mouse is clicked within the current ellipse
  if(mouseX >= currentX - ellipseW/2 && mouseX <= currentX + ellipseW/2 &&
     mouseY >= currentY - ellipseW/2 && mouseY <= currentY + ellipseW/2) {
       fill(0); //the ellipse changes color
       savedX = currentX; //the variables save the coordinates of the old ellipse
       savedY = currentY;
       currentX = random(ellipseW, width - ellipseW); //holeX and holeY get new random values
       currentY = random(ellipseW, height - ellipseW); 
       x++; //the counter increases
       col = random(50, 200);
       col2 = random (50, 200);
       col3 = random(0, 50);
     }
   //if the mouse is clicked within the original ellipse
   if(mouseX >= originalX - ellipseW/2 && mouseX <= originalX + ellipseW/2 &&
     mouseY >= originalY - ellipseW/2 && mouseY <= originalY + ellipseW/2 &&
     x > 2){
       background(43, 54, 94); //erases the past drawing
       originalX = random(ellipseW, width - ellipseW); //new random origin
       originalY = random(ellipseW, height - ellipseW);
       currentX = savedX = originalX; //all variables reset to be the same
       currentY = savedY = originalY;
       x = 1;
     } 
}
