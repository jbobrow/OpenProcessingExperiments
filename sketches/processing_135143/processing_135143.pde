

void setup()  
{  


size(800, 800);    
fill(255);  
background (0,0,0);  
}  
void draw() {  
if (mousePressed) 
 {  
stroke(255); 
} else 
{ 
stroke(120);  
}  

ellipse (mouseX, mouseY, 80, 80);} 

