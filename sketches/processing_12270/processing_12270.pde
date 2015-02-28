
 /** By: Savannah Franklin
  * Abstract Shapes
  */

 int clickX, clickY, releaseX, releaseY;
 boolean nowDragging;
 int dragRed, moveBlue;

 void setup()
 { 
  size(500, 500);
  background(255, 200, 255);
  smooth();
  strokeWeight(10);
 }

void draw()
 {
   if(mousePressed == true);
 
  // green rectangle
  rect(110, 55, mouseX, mouseY);
  fill(55, 220, 190);
  strokeWeight(1);
  
  
  // pink circle
  ellipse(270, 255, mouseX, mouseY);
  fill(270, 255, 190);
  strokeWeight(2);
  
  // yellow circle
  ellipse(25, 59, mouseX, mouseY);
  fill(255, 255, 0);
  strokeWeight(5);
  
  // purple line
  line(50, 90, height, width);
  fill(126, 0, 255);
  strokeWeight(8);

  //blue rectangle
  rect(50, 125, mouseX, mouseY);
  fill(77, 99, 30);
  strokeWeight(9);
  
  // brown circle
  ellipse(100, 75, mouseX, mouseY);
  fill(133, 0, 30);
  strokeWeight(7);
  
  //grey circle
  ellipse(200, 66, mouseX, mouseY);
  fill(149, 149, 149);
  strokeWeight(6);
  
  //yellow circle
  ellipse(245, 30, mouseX, mouseY);
  fill(255, 255, 0);
  strokeWeight(10);
  
  // red square
  rect(122, 90, mouseX, mouseY);
  fill(255, 5, 0);
  strokeWeight(5);
  
  //teal square
  rect(23, 100, mouseX, mouseY);
  fill(0, 148, 199);
  strokeWeight(8);
  
  //cream color square
  rect(clickX, clickY, mouseX, mouseY);
  fill(255, 247, 186);
  strokeWeight(3);
  
  // bright pink circle
  rect(clickX, clickY, mouseX, mouseY);
  fill(255, 0, 107);
  strokeWeight(4);
  
  // green square
  float a = sq(15);
  rect(122, 45, a, 10);
  fill(255, 163, 30);
  strokeWeight(1);
 }
 
 
 
  


  

 

  
  
  
  
  
  
  
 
 
   



 


  
  




