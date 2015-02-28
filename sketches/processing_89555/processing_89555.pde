
void setup (){ 
size(480,480); 
smooth(); 
} 

void draw() { 
//draw a line with my mouse while I have the button pressed. 
if (mousePressed==true){ 
line (mouseX,mouseY,pmouseX,pmouseY); 
} 
} 
//when the button is released the line will change color 
void mouseReleased() { 
stroke(random(0,255),random(0,255),random(0,255)); 

}
