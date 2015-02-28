
void setup() { 
 
size(500,500); 
 
smooth(); 
 
background(255);
frameRate (65);
 
} 
 
void draw() { 
 
  stroke(pmouseX,200,pmouseY,88); 
 
if (mousePressed) { 
 
fill(0); 
 
} else { 
 
fill(203,197,197); 
 
} 
 
strokeWeight(1); 
 
    
 
int d = 1; 
 
ellipse(mouseY,mouseX,100,d);   // Left 
 
ellipse(mouseX, mouseY, d, 100);  // Right 
ellipse(mouseX,mouseY,100,d);
ellipse(mouseY,mouseX,d,100);
ellipse(mouseX,mouseY,5,10);
ellipse(mouseY,mouseX,10,10);
}

