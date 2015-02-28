

/*

Magali Jaume
June,2009
magali@magalijaume.com
Base on Aj Barlas Speed balls

*/

boolean Drawing=false; 
 
void setup(){
  
  size(900,300); 
  background(255); 
  smooth();  
   
  }; 
 
void draw(){
  
 if (Drawing) {  
  variableEllipse(mouseX,mouseY,pmouseX,pmouseY); 
    } 
  }; 
 
 
void variableEllipse(int x, int y, int px, int py) { 
  float speed=abs(x-px) + abs(y-py);  
  ellipse(x,y,speed,speed);
  stroke(random(0,255),random(0,255), random(0,255),80);
  fill(204,255,255,50); 
  } 
   
   
void mousePressed() { 
  Drawing=!Drawing; 
} 


