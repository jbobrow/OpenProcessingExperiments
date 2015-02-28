
/* 
EX1_Draw 
Kristian Hallegado 
1/29/2013 

This is a drawing program that we will use to try 
different functions in an interactive environment. 
*/ 


void setup() { 
size(480, 480); 
smooth(); 
} 
void draw(){ 
//draw a line with my mouse while i have the button pressed. 

if (mousePressed == true){ // change the color when i click the mouse 
line(mouseX,mouseY,pmouseX,pmouseY); 
} 
} 
/*when the mouse is pressed and then let go, another click of the 
mouse changes the stroke color 
*/ 
void mouseReleased(){ 
stroke(random(0,255),random(0,255),random(0,255),120); 
}
