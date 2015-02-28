
//Amy Findeiss
//August 9, 2010
//EYES

//for blinking
boolean eyesOpen = true;
//for pupils
float xPosLeft;
float yPosLeft;
float xPosRight;
float yPosRight;

void setup () {
  size (400,400);
  background(0);
  smooth();
}

void draw() {
//for whites
  background(0);
  smooth(); 
  ellipse(100,100,120,120);
  ellipse(240,100,120,120);
  
//for pupils (sad that i can only do black)
  fill(0);
  ellipse(xPosLeft, yPosLeft, 20, 20);
  ellipse(xPosRight, yPosRight, 20, 20);
   
  xPosLeft = constrain(mouseX, width/8, 3*width/8);
  yPosLeft = constrain(mouseY, height/8, 3*height/8);
   
  xPosRight = constrain(mouseX, 5*width/8, 7*width/8);
  yPosRight = constrain(mouseY, height/8, 3*height/8);

//for mouse click for blinking
  if (eyesOpen) {
  fill(255);
  }
  else {
   fill(0); 
  }
  
  
  
//  xPos = constrain(mouseX, width/4, 3*width/4);
//  yPos = constrain(mouseY, height/4, 3*height/4);
//  ellipse(xPos, yPos, 20, 20);
  
  
//  print (eyesOpen);
  
} 

//void mousePressed() {
//  fill(255, 255, 255);
//  ellipse(100, 100, 50, 50);
//  ellipse(175, 100, 50, 50);
//  
//}

void mouseReleased() {
  eyesOpen = !eyesOpen;
  
}


