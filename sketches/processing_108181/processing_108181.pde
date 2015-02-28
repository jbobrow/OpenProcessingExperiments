
void setup() 
{ 
size(600, 600); 
noSmooth(); 
fill(126); 
background (10,10,10); 
} 
void draw() { 
if (mousePressed) 
{ 
stroke(255);
} else 
{
stroke(0); 
} 
ellipse (mouseX, mouseY, 5, 15);}
