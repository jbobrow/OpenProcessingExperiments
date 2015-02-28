
/*this is my homework for the first week of class in C&C Lab. 
Instructions: - Create a sculptural image or animation in Processing, 
including the following:
_FUNCTIONS 
_PUSH/POP MATRIX 
_3+ MATRIX TRANSFORMATIONS (translate, rotate, scale) 
Use this as a chance to review the principles of geometry, color, and 
coordinate system that you learned in bootcamp. 
Be intentional with your design; if possible start with a visual sketch 
of an idea to use as reference.
*/

//I'm going to make a shape whose position morphs, so set integers for the positions
int yPos1;
int xPos2;
int yPos2;
int xPos3;
int yPos3;
int xPos4;
int yPos4;

int r;
int g;
int b;

int[] xPos1 = new int[20];

void setup(){
 background(255, 255, 255);
  size(500,500); 
  r = 0;
  g = 144;
  b = 200;
  
  for (int i=0; i<20; i++){
  xPos1[i] += 50;
  
  yPos1 = xPos1[i];
  xPos2 = yPos1 + 50;
  yPos2 = yPos1 - 50;
  xPos3 = xPos2 + 50;
  yPos3 = yPos1;
  xPos4 = xPos2;
  yPos4 = yPos1 + 100;
  
}
}
void draw(){
  background(255, 255, 255);
 
  
 /* This is not working! I want it to keep going through and making new shapes with each [i] I don't know what's going wrong, trying different things...*/
 for (int i=0; i<20; i++) {
 beginShape();
   vertex(xPos1[i], yPos1);
   vertex(xPos2, yPos2);
   vertex(xPos3, yPos3);
   vertex(xPos4, yPos4);
   vertex(xPos1[i], yPos1);
  endShape();
 }
 for (int i=0; i<20; i++){
  pushMatrix();
   translate(width/2, height/2);
   scale(2, 4);
   rotate(PI);
    rect(40, 30, 20, 20);
  fill(r, g, b);
 beginShape();
   vertex(xPos1[i], yPos1);
   vertex(xPos2, yPos2);
   vertex(xPos3, yPos3);
   vertex(xPos4, yPos4);
   vertex(xPos1[i], yPos1);
  endShape();
  popMatrix();
 }
//why is nothing showing up below???? 
 pushMatrix();
 fill(40, 255, 255);
 translate(width/2, height/2);
 rotate(PI);
 rect(-200, -200, 50, 50);
 scale(3, 2);
 rect(-40, -100, 50, 50);
 popMatrix();
 
 pushMatrix();
 fill(25, 175, 210);
 //rotate(PI/2);
 rect(40, 40, 20, 20);
 translate(width/2, height/2);
 rect(30, 30, 40, 40);
 popMatrix();
 
 
fill (200, 187, 210);
for(int i=0; i<20; i++){
beginShape();
   vertex(xPos1[i], yPos1);
   vertex(xPos2, yPos2);
   vertex(xPos3, yPos3);
   vertex(xPos4, yPos4);
   vertex(xPos1[i], yPos1);
  endShape();
}
 fill(r, g, b);
 rect(300, 300, 50, 50);
}
 
 void mouseClicked(){
   r = 105;
   g = 240;
   b = 225;
 }
 
 void mouseDragged(){
   background (0, 0, 0);
   r = 0;
   g = 0;
   b = 0;
   fill(255, 40, 86);
   rect(pmouseX, pmouseY, mouseX, mouseY);
 }
 

