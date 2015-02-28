
/*
boo square
June 2009
jenna@jennaledger.com
*/

boolean Drawing=false; 
 
void setup()  { 
  size(800,300); 
  background(90,90,90); 
  smooth(); 
  fill(150,50,150,30); 
  } 
 
void draw() { 
 if (Drawing) { 
  variableLine(mouseX,mouseY,pmouseX,pmouseY); 
 { 
  variableEllipse(mouseX,mouseY,pmouseX,pmouseY); 
    } 
  } 
} 
 
void variableEllipse(int x, int y, int px, int py) { 
  float speed=abs(x-px) + abs(y-py); 
  stroke(20,150,50,50); 
  rect(x,y,speed,speed); 
  } 
   
void variableLine(int x, int y, int px, int py) { 
    float speed=abs(y-px) + abs(x-py); 
    stroke(40,40,40,50); 
    line(pmouseX,mouseY,speed,speed); 
} 
   
void mousePressed() { 
  Drawing= !Drawing; 
} 


