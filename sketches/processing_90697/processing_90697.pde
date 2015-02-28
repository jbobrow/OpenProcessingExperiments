
/* 
EX2_draw 
Chad Cruz
1/29/2013 

This is a drawing program that we will use to try 
different functions in an interactive environment. 
*/ 

void setup(){ 
size(480,480); 
smooth(); 

} 

void draw(){ 
//draw a line with my mouse while i click with the mouse 
if (mousePressed == true){ 
line(pmouseX,pmouseY,mouseX, mouseY); 

} 
} 
/*change the color of the line after release 
of the mouse button*/ 
void mouseReleased(){ 
stroke(random(0,255),random(0,255),random(0,255),120); 
}
