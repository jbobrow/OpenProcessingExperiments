
float x; float easing = .04; float diameter = 12;

void setup() {  
size(600, 600);   
fill(0, 102);  
smooth();  
}
void draw() { 
 strokeWeight(4);  
if (mousePressed == true)  
 strokeWeight(8); 
float targetX = mouseX;  
x += (targetX - x) * easing;
background(178,102,255);  
fill(76, 255, 207);
rect(0, 10, 600, 75); //top
fill(76, 255, 207);
rect(225, 500, 200, 75); //bottom
fill(255, 255, 255);
rect (mouseX-150, mouseY-125, 50, 50); //ear
rect (mouseX-100, mouseY-75, 150, 150); //head
rect (mouseX+50, mouseY-125, 50, 50); //ear
fill(245, 238, 126);
triangle(mouseX-25, mouseY-175, mouseX-50, mouseY-75, mouseX+0, mouseY-75);
fill(0);
rect (mouseX-40, mouseY-10, 5, 15); //eye
rect (mouseX-10, mouseY-10, 5, 15); //eye
rect (mouseX-75, mouseY+50, 5, 5); //nostril
rect (mouseX+25, mouseY+50, 5, 5); //nostril
println(targetX + " : " + x); 
  textSize(50);
  fill(178,102,255);
text("Unicorn Blitz", 150, 60);
fill(178,102,255);
text("START",250, 550);
}
 





