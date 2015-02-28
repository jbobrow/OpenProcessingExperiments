
/* 
 Ex2_Draw 
 Tyler Long 
 1-29-2013 

 This is a drawing program that we will use to try 
 different functions in an interactive environment. 
*/ 

void setup(){ 
 size(480,480); 
 smooth(); 
} 

void draw(){ 
 //Draw aline with my mouse while i have the button pressed 
 if (mousePressed==true){ 
 line(mouseX,mouseY,pmouseX,pmouseY); 
 } 
} 
void mouseReleased(){ 
/*changes the color when the button is released 
so when you click again the color is different 
*/ 
 stroke(random(0,255),random(0,255),random(0,255),120); 
}
