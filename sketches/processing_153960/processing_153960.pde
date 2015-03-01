
  int selectedRed = 0;
  int selectedGreen = 0;
  int selectedBlue = 0;
  
  int boxHeight = 20;
  int boxWidth = 255;
  
  int boxX = 50;
  int redBoxY = 50;
  int greenBoxY = 100;
  int blueBoxY = 150;
  
void setup()
{
  size(450, 250);
  background(255);
  stroke(111);
  
  // red box
  fill(255,0,0);
  rect(boxX, redBoxY, boxWidth, boxHeight);
  fill(0);
  text("0", boxX-10, redBoxY+13);
  text("255", boxX+boxWidth+5, redBoxY+13);
    
  // green box
  fill(0,255,0);
  rect(boxX, greenBoxY, boxWidth, boxHeight); 
  fill(0);
  text("0", boxX-10, greenBoxY+13);
  text("255", boxX+boxWidth+5, greenBoxY+13);
  
  // blued box
  fill(0,0,255);
  rect(boxX, blueBoxY, boxWidth, boxHeight); 
  fill(0);
  text("0", boxX-10, blueBoxY+13);
  text("255", boxX+boxWidth+5, blueBoxY+13);
  
  stroke(111);
  fill(selectedRed,selectedGreen,selectedBlue);
  rect(boxX, height-40, 20, 20);
  fill(0);
  text("Resulting colour", boxX, height-50); 
}

void draw() {}

void mousePressed()
{
  fill(255);
  stroke(255);
  // Check if red box was selected
  if (mouseX > boxX && mouseX < boxX+boxWidth && 
  mouseY > redBoxY && mouseY < redBoxY+boxHeight) {     
    fill(255); // Override previous text with white
    rect(boxX+boxWidth+70,  redBoxY+3, 30, 10);  
    selectedRed = mouseX-boxX;
    fill(0);
    text(selectedRed, boxX+boxWidth+70, redBoxY+13);  
    println("red box selected");
  } 
  
 // Check if green box was selected 
  if (mouseX > boxX && mouseX < boxX+boxWidth && 
  mouseY > greenBoxY && mouseY < greenBoxY+boxHeight) {     
    fill(255); // Override previous text with white
    rect(boxX+boxWidth+70,  greenBoxY+3, 30, 10);  
    selectedGreen = mouseX-boxX;
    fill(0);   
    text(selectedGreen, boxX+boxWidth+70, greenBoxY+13);  
    println("green box selected");
  }  
   
   // Check if blue box was selected 
  if (mouseX > boxX && mouseX < boxX+boxWidth && 
  mouseY > blueBoxY && mouseY < blueBoxY+boxHeight) {     
    fill(255); // Override previous text with white
    rect(boxX+boxWidth+70,  blueBoxY+3, 30, 10);  
    selectedBlue = mouseX-boxX;
    fill(0);
    text(selectedBlue, boxX+boxWidth+70, blueBoxY+13);  
    println("blue box selected");
  }  
  
  stroke(111);
  fill(selectedRed,selectedGreen,selectedBlue);
  rect(boxX, height-40, 20, 20);
}


