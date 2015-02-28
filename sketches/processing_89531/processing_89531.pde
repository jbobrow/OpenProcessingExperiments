
/* 
EX2_Draw 
Eleni Bazezew 
1/29/2013 

This is a drawing program that we will use to try 
different functions in a interactive environment. 
*/ 

void setup () { 
size (480,480); 
smooth (); 
} 

void draw(){ 
//Draw a line with my mouse while i have the button pressed 
if(mousePressed==true){ 
line(mouseX,mouseY,pmouseX,pmouseY); 
} 
} 

// When i release the mouse button it will change mouse color 
void mouseReleased(){ 
stroke (random(0,255),random(0,255),random(0,255),120); 
}
